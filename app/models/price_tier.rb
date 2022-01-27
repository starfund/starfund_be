# == Schema Information
#
# Table name: price_tiers
#
#  id               :bigint           not null, primary key
#  us               :integer
#  ru               :integer
#  level            :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  name             :string
#  stripe_id        :string
#  originator       :string
#  stripe_id_annual :string
#  us_annual        :integer
#
class PriceTier < ApplicationRecord
  def to_us(tier)
    find_by(level: tier).us
  end

  def to_ru(tier)
    find_by(level: tier).ru
  end

  def self.stripe_price(sub_type, originator, price)
    if sub_type == "monthly" then
      sys_price = PriceTier.find_by(us:price, originator:originator)
    elsif sub_type == "yearly" then
      sys_price = PriceTier.find_by(us_annual:price, originator:originator)
    end
    if sub_type == "monthly" then
      stripe_price_id = sys_price.stripe_id
    elsif sub_type == "yearly" then
      stripe_price_id = sys_price.stripe_id_annual
    end
    return stripe_price_id
  end
end
