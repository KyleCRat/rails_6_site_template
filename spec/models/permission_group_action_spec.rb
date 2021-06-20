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

require 'rails_helper'

RSpec.describe PermissionGroupAction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
