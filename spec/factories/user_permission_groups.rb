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

FactoryBot.define do
  factory :user_permission_group do
    user             { nil }
    permission_group { nil }
  end
end
