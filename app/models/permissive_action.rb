# == Schema Information
#
# Table name: permissive_actions
#
#  id         :integer          not null, primary key
#  klass      :string
#  action     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PermissiveAction < ApplicationRecord
  has_many :permission_group_actions

  has_many :permission_groups,
           through: :permission_group_actions

  has_many :users,
           through: :permission_groups

  validates :klass,
            uniqueness: { scope: :action }
end
