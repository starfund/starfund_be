# == Schema Information
#
# Table name: organizations
#
#  id            :bigint           not null, primary key
#  name          :string
#  ppv_price     :integer
#  price_tier_id :bigint           default(1), not null
#
# Indexes
#
#  index_organizations_on_price_tier_id  (price_tier_id)
#
class Organization < ApplicationRecord
  belongs_to :price_tier

  def price_by_geo(geo)
    return price_tier.ru if geo == 'ru'
  
    price_tier.us
  end 
end
