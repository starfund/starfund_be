# == Schema Information
#
# Table name: organizations
#
#  id              :bigint           not null, primary key
#  name            :string
#  ppv_price       :integer
#  price_tier_id   :bigint           default(1), not null
#  yearly_discount :integer
#
# Indexes
#
#  index_organizations_on_price_tier_id  (price_tier_id)
#
class Organization < ApplicationRecord
  belongs_to :price_tier
  has_many :org_events

  has_one_attached :cover_photo
  has_one_attached :mobile_cover_photo

  scope :with_events, -> { includes([:org_events]) }

  def yearly_discount 
    100 - ((price_tier.us_annual * 100)/(price_tier.us * 12))
  end

  def price_by_geo(geo)
    return price_tier.ru if geo == 'ru'
  
    price_tier.us
  end

  def upcoming_event
    org_events.find_by(home_page: true)
  end
end
