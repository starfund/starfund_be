# == Schema Information
#
# Table name: credit_cards
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_credit_cards_on_user_id  (user_id)
#

FactoryBot.define do
  factory :credit_card do
    user { nil }
  end
end
