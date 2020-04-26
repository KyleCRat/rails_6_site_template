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

FactoryBot.define do
  factory :permission_group_actions do
    permissive_action { nil }
    permission_group  { nil }
  end
end
