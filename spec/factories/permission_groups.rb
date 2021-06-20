# == Schema Information
#
# Table name: permission_groups
#
#  id    :bigint           not null, primary key
#  title :string
#  type  :string
#

FactoryBot.define do
  factory :permission_group do
    title { Faker::Types.rb_string }
    type  { %w[Role Privilege].sample }

    after(:create) do |group|
      create_list(:random_permissive_action, rand(1..2), permission_groups: [group])
    end
  end
end
