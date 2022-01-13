# == Schema Information
#
# Table name: subscriptions
#
#  id               :bigint           not null, primary key
#  user_id          :bigint           not null
#  fighter_id       :bigint
#  last_charge      :integer
#  last_charge_date :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  status           :integer
#  stripe_sub       :string
#  team_id          :bigint
#  business_id      :bigint
#  organization_id  :bigint
#
# Indexes
#
#  index_subscriptions_on_business_id      (business_id)
#  index_subscriptions_on_fighter_id       (fighter_id)
#  index_subscriptions_on_organization_id  (organization_id)
#  index_subscriptions_on_team_id          (team_id)
#  index_subscriptions_on_user_id          (user_id)
#
class Subscription < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :fighter, optional: true
  belongs_to :team, optional: true
  belongs_to :business, optional: true
  belongs_to :organization, optional: true

  default_scope { includes([:team])
                  .includes([:fighter]) 
                  .includes([:business])
                }
  scope :with_user, -> { includes([:user]) }

  enum status: { active: 0, inactive: 1, canceled: 2 }

  aasm column: :status do
    state :active, initial: true
    state :inactive, :canceled

    event :cancel do
      transitions from: :active, to: :canceled
    end

    event :renew do
      transitions from: :inactive, to: :active
    end

    event :cancel do
      transitions from: :active, to: :canceled
    end

    event :invalidate do
      transitions from: :active, to: :inactive
      transitions from: :canceled, to: :inactive
    end
  end

  def private_content
    fighter_content = fighter&.private_content || []
    team_content = team&.fighters&.map(&:private_content) || []
    fighter_content + team_content
  end

  def org_email
    if last_charge == organization.price_tier.us
      UserMailer.with(
        user: user_id,
        organization: organization.id
      ).welcome_monthly.deliver_later
    else
      UserMailer.with(
        user: user_id,
        organization: organization.id
      ).welcome_annualy.deliver_later
    end
  end

end
