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

FactoryBot.define do
  factory :permission_group_actions do
    permissive_action { nil }
    permission_group  { nil }
  end
end
