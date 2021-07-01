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
#  slogan        :string
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
  has_many :business_contents

  has_one_attached :cover_photo
  has_one_attached :profile_pic
  has_one_attached :official_preview

  def price_by_geo(geo)
    return price_tier.ru if geo == 'ru'

    price_tier.us
  end
end
