# == Schema Information
#
# Table name: permission_overrides
#
#  id                   :integer          not null, primary key
#  user_id              :uuid             not null
#  permissive_action_id :integer          not null
#  permitted            :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

FactoryBot.define do
  factory :permission_override do
    user { nil }
    permissive_action { nil }
    permitted { false }
  end
end
