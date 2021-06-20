# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  username               :string
#  slug                   :string
#  log_data               :jsonb
#

class User < ApplicationRecord
  # Change Tracking
  has_logidze

  # Authentication relations and methods
  include Permissable

  before_validation :underscore_slug

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :lockable,
         :trackable

  has_one_attached :avatar

  validates :first_name,
            :last_name,
            :username,
            presence: true

  validates :slug,
            exclusion: { in: ['me'],
                         message: "%{value} is reserved." },
            length: { in: 4..24 },
            uniqueness: true,
            allow_blank: true

  scope :admins, -> { joins(:permission_groups).where(permission_groups: { title: 'Administrator' }) }
  scope :excluding_admins, -> { where.not(id: admins&.pluck(:id)) }

  ##############################################################################
  # Methods

  def time_zone
    'UTC'
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def underscore_slug
    self.slug = self.slug.parameterize.underscore unless slug.blank?
  end

  def to_param
    return id if slug.blank? || slug_changed?

    slug
  end
end
