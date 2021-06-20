# == Schema Information
#
# Table name: permission_group_actions
#
#  id                   :bigint           not null, primary key
#  permissive_action_id :bigint           not null
#  permission_group_id  :bigint           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class PermissionGroupAction < ApplicationRecord
  belongs_to :permissive_action
  belongs_to :permission_group
end
