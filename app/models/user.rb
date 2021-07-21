# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default(FALSE)
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  first_name             :string           default("")
#  last_name              :string           default("")
#  username               :string           default("")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  tokens                 :json
#  card_id                :string
#  customer_id            :string
#  birthdate              :date
#  is_fighter             :boolean          default(FALSE), not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :uid, uniqueness: { scope: :provider }

  has_many :credit_cards
  has_many :subscriptions, -> { includes([:fighter])}
  has_many :comments
  has_many :charges
  has_many :fighter_reports

  before_validation :init_uid

  def full_name
    return username if first_name.blank?

    "#{first_name} #{last_name}"
  end

  def default_card
    credit_cards.find_by(default: true)
  end

  def active_subscriptions
    subscriptions.filter(&:active?)
  end

  def has_sub(fighter)
    return false if subscriptions.empty?

    subscriptions.map(&:fighter).include?(fighter)
  end

  def self.from_social_provider(provider, user_params)
    where(provider: provider, uid: user_params['id']).first_or_create! do |user|
      user.password = Devise.friendly_token[0, 20]
      user.assign_attributes user_params.except('id')
    end
  end

  def last_report
    return unless is_fighter?

    fighter_reports.order(year: :desc, month: :desc, week: :desc)&.first
  end

  private

  def init_uid
    self.uid = email if uid.blank? && provider == 'email'
  end
end
