# == Schema Information
#
# Table name: permission_groups
#
#  id    :integer          not null, primary key
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

  scope :role,      -> { where(type: 'Role') }
  scope :privilege, -> { where(type: 'Privilege') }
end
