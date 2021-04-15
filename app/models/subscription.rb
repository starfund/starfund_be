# == Schema Information
#
# Table name: subscriptions
#
#  id               :bigint           not null, primary key
#  user_id          :bigint           not null
#  fighter_id       :bigint           not null
#  last_charge      :integer
#  last_charge_date :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  status           :integer
#  stripe_sub       :string
#
# Indexes
#
#  index_subscriptions_on_fighter_id  (fighter_id)
#  index_subscriptions_on_user_id     (user_id)
#
class Subscription < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :fighter

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

end
