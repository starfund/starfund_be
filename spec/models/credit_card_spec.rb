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

require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
