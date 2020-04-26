module Authenticateable
  extend ActiveSupport::Concern

  included do
    has_many :user_permission_groups

    has_many :permission_groups,
             through: :user_permission_groups,
             dependent: :destroy

    has_many :roles, -> { role },
             through: :user_permission_groups,
             source: :permission_group,
             dependent: :destroy

    has_many :privileges, -> { privilege },
             through: :user_permission_groups,
             source: :permission_group,
             dependent: :destroy

    has_many :permissions,
             source: :permissive_actions,
             through: :permission_groups

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
  end

  def authorized?(object)
    if object.is_a?(PermissiveAction)
      klass = object.klass.to_s
      action = object.action
    elsif object.class <= ApplicationController
      klass = object.class.to_s
      action = object.action_name
    else
      klass = object[:klass].to_s
      action = object[:action].to_s
    end

    return false if denied_actions.where(klass: klass, action: action).any?

    return true  if allowed_actions.where(klass: klass, action: action).any?

    permissions.where(klass: klass, action: action).any?
  end
end
