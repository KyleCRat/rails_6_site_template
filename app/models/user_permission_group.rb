# == Schema Information
#
# Table name: user_permission_groups
#
#  id                  :bigint           not null, primary key
#  user_id             :uuid             not null
#  permission_group_id :bigint           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class UserPermissionGroup < ApplicationRecord
  belongs_to :user
  belongs_to :permission_group
end
