# == Schema Information
#
# Table name: permission_overrides
#
#  id                   :bigint           not null, primary key
#  user_id              :uuid             not null
#  permissive_action_id :bigint           not null
#  permitted            :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'rails_helper'

RSpec.describe PermissionOverride, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
