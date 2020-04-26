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

class PermissionOverride < ApplicationRecord
  belongs_to :user
  belongs_to :permissive_action

  scope :allowed, -> { where(permitted: true) }
  scope :denied,  -> { where(permitted: false) }
end
