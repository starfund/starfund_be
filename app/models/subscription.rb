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
#
# Indexes
#
#  index_subscriptions_on_fighter_id  (fighter_id)
#  index_subscriptions_on_user_id     (user_id)
#
class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :fighter
end
