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

FactoryBot.define do
  factory :permission_override do
    user { nil }
    permissive_action { nil }
    permitted { false }
  end
end
