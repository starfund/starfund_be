# == Schema Information
#
# Table name: credit_cards
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  card_id    :string
#  default    :boolean          default(FALSE)
#
# Indexes
#
#  index_credit_cards_on_user_id  (user_id)
#

class CreditCard < ApplicationRecord
  belongs_to :user
end
