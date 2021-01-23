# == Schema Information
#
# Table name: payments
#
#  id         :bigint           not null, primary key
#  amount     :integer
#  concept    :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_payments_on_user_id  (user_id)
#

FactoryBot.define do
  factory :payment do
    user { "" }
    amount { "" }
    concept { "MyString" }
  end
end
