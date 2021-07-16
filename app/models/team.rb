# == Schema Information
#
# Table name: teams
#
#  id            :bigint           not null, primary key
#  name          :string
#  country       :string
#  preview_url   :string
#  price_tier_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_teams_on_price_tier_id  (price_tier_id)
#
class Team < ApplicationRecord
  belongs_to :price_tier
  has_many :fighters

  has_one_attached :cover_photo
  has_one_attached :profile_pic

  def price_by_geo(geo)
    return price_tier.ru if geo == 'ru'

    price_tier.us
  end

  def public_content
    contents.where(public: true)
  end

  def private_content
    contents.where(public: false)
  end
end
