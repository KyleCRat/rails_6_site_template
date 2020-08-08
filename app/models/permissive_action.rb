# == Schema Information
#
# Table name: permissive_actions
#
#  id         :bigint           not null, primary key
#  klass      :string
#  action     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PermissiveAction < ApplicationRecord
  has_many :permission_group_actions,
           dependent: :destroy

  has_many :permission_groups,
           through: :permission_group_actions

  has_many :permission_overrides,
           dependent: :destroy

  has_many :users,
           through: :permission_groups

  validates :klass,
            uniqueness: { scope: :action }

  def to_s
    "#{klass}: #{action}"
  end

  def self.create_by_class(klass, **opts)
    actions = %i[create read update destroy]

    if opts.blank? || (opts[:except] ^ opts[:only] ^ opts[:actions])
      if opts[:except]
        actions.except!(opts[:except])
      elsif opts[:only]
        actions = opts[:only]
      elsif opts[:actions]
        actions = opts[:actions]
      end
    else
      raise(ArgumentError, 'Must include a single method: except: [], only: [], or actions: []')
    end

    permissive_actions = []

    actions.each do |action|
      permissive_actions << find_or_create_by(klass: klass, action: action)
    end

    permissive_actions
  end

  def self.destroy_by_class(klass)
    PermissiveAction.where(klass: klass).destroy_all
  end
end
