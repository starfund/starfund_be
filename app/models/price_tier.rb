# == Schema Information
#
# Table name: price_tiers
#
#  id         :bigint           not null, primary key
#  us         :integer
#  ru         :integer
#  level      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  stripe_id  :string
#  originator :string
#
class PriceTier < ApplicationRecord
  def to_us(tier)
    find_by(level: tier).us
  end

  def to_ru(tier)
    find_by(level: tier).ru
  end
end
