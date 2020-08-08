# == Schema Information
#
# Table name: permission_groups
#
#  id    :bigint           not null, primary key
#  title :string
#  type  :string
#

class PermissionGroup < ApplicationRecord
  include StiPreload

  has_many :permission_group_action

  has_many :permissive_actions,
           through: :permission_group_action,
           dependent: :destroy

  has_many :user_permission_groups

  has_many :users,
           through: :user_permission_groups,
           dependent: :destroy

  validates :title,
            uniqueness: { scope: :type }

  scope :roles,         -> { where(type: 'Role') }
  scope :privileges,    -> { where(type: 'Privilege') }
  scope :subscriptions, -> { where(type: 'Subscription') }

  def self.inherited(child)
    child.instance_eval do
      def model_name
        PermissionGroup.model_name
      end
    end
    super
  end
end
