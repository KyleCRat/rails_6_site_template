module Permissable
  extend ActiveSupport::Concern

  included do
    has_many :user_permission_groups

    has_many :permission_groups,
             through: :user_permission_groups,
             dependent: :destroy

    has_many :roles, -> { roles },
             through: :user_permission_groups,
             source: :permission_group,
             dependent: :destroy

    has_many :privileges, -> { privileges },
             through: :user_permission_groups,
             source: :permission_group,
             dependent: :destroy

    has_many :subscriptions, -> { subscriptions },
             through: :user_permission_groups,
             source: :permission_group,
             dependent: :destroy

    has_many :permissions,
             source: :permissive_actions,
             through: :permission_groups

    has_many :permission_overrides

    has_many :overrided_actions,
             through: :permission_overrides,
             source: :permissive_action,
             class_name: 'PermissiveAction',
             dependent: :destroy

    has_many :allowed_overrides, -> { allowed },
             source: :permission_overrides,
             class_name: 'PermissionOverride'

    has_many :denied_overrides, -> { denied },
             source: :permission_overrides,
             class_name: 'PermissionOverride'

    has_many :allowed_actions,
             through: :allowed_overrides,
             source: :permissive_action,
             dependent: :destroy

    has_many :denied_actions,
             through: :denied_overrides,
             source: :permissive_action,
             dependent: :destroy

    def self.serialize_from_session(key, salt)
      record = where(id: key).eager_load(
        :permissions,
        :allowed_actions,
        :denied_actions,
        permission_groups: :permissive_actions
      ).first
      record if record && record.authenticatable_salt == salt
    end
  end

  def admin?
    roles.find_by(title: 'Administrator')
  end

  def admin!
    self.roles << Role.find_or_create_by(title: 'Administrator')
  end

  def authorized?(object)
    Rails.logger.debug '-' * 50
    Rails.logger.debug "Checking User UUID: #{self.id} permissions for: #{object.inspect} "
    Rails.logger.debug '-' * 50
    # Handle Errors if authorize was called with blank object
    if object.blank?
      handle_empty_authorization
      return false

    # always return true if user is an Administrator
    elsif self.admin?
      return true

    # handle if object is a PermissiveAction model
    elsif object.is_a?(PermissiveAction)
      klass = object.klass.to_s
      action = object.action

    # handle if object is passed a controller method
    elsif object.class <= ApplicationController
      klass = object.controller_name.classify
      action = object.action_name

    # handle if object is a hash
    elsif object.is_a?(Hash)
      klass = object[:klass].to_s
      action = object[:action].to_s
    else
      object_not_recognized(object)
    end

    permissive_action = PermissiveAction.find_by(klass: klass, action: action)

    action_not_found(klass, action) unless permissive_action

    return false if denied_actions.include?(permissive_action)

    return true  if allowed_actions.include?(permissive_action)

    permissions.include?(permissive_action)
  end

  private

  def handle_empty_authorization
    message = <<~MSG
      Authenticatable.authorized? was passed a blank object.
    MSG

    error_by_environment(message)
  end

  def action_not_found(klass, action)
    message = <<~MSG
      Authenticatable.authorized? was reqested to authorize a permission that
      could not be found:
        Klass:  #{klass}
        Action: #{action}
    MSG

    error_by_environment(message)
  end

  def object_not_recognized(object)
    message = <<~MSG
      Authenticatable
        Klass:  #{klass}
        Action: #{action}
    MSG

    error_by_environment(message)
  end

  def error_by_environment(message)
    if Rails.env.development?
      raise(StandardError, message)
    else
      Rails.logger.error message
    end
  end
end
