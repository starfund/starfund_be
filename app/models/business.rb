# == Schema Information
#
# Table name: businesses
#
#  id            :bigint           not null, primary key
#  name          :string
#  country       :string
#  birthdate     :date
#  category      :string
#  price_tier_id :bigint           not null
#  content_id    :bigint
#
# Indexes
#
#  index_businesses_on_content_id     (content_id)
#  index_businesses_on_price_tier_id  (price_tier_id)
#
class Business < ApplicationRecord
  belongs_to :price_tier
  belongs_to :content, optional: true # Official preview

  has_many :courses
end
