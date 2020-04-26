# == Schema Information
#
# Table name: permission_group_actions
#
#  id                   :integer          not null, primary key
#  permissive_action_id :integer          not null
#  permission_group_id  :integer          not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'rails_helper'

RSpec.describe PermissionGroupAction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
