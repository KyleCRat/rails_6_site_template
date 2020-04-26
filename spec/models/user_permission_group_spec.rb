# == Schema Information
#
# Table name: user_permission_groups
#
#  id                  :integer          not null, primary key
#  user_id             :uuid             not null
#  permission_group_id :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe UserPermissionGroup, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
