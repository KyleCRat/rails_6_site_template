# == Schema Information
#
# Table name: authorizations
#
#  id         :integer          not null, primary key
#  klass      :string
#  action     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :permissive_action do
    klass  { 'PagesController' }
    action { 'index' }

    factory :random_permissive_action do
      klass  { Faker::Games::Pokemon.name }
      action { Faker::Games::Pokemon.move }
    end
  end
end
