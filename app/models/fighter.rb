# == Schema Information
#
# Table name: fighters
#
#  id            :bigint           not null, primary key
#  first_name    :string
#  last_name     :string
#  country       :string
#  reach         :float
#  height        :integer
#  birthdate     :date
#  organization  :string
#  preview_url   :string
#  sub_price     :integer
#  price_tier_id :bigint           default(1), not null
#  content_id    :bigint
#  support       :boolean          default(FALSE)
#  team_id       :bigint
#  url_name      :string
#
# Indexes
#
#  index_fighters_on_content_id     (content_id)
#  index_fighters_on_price_tier_id  (price_tier_id)
#  index_fighters_on_team_id        (team_id)
#
class Fighter < ApplicationRecord
  belongs_to :price_tier
  belongs_to :team, optional: true
  belongs_to :content, optional: true # Official prview
  has_many :contents
  has_many :fighter_reports

  has_many_attached :public_videos
  has_many_attached :private_videos
  has_one_attached :cover_photo
  has_one_attached :profile_pic

  default_scope { includes([:team]).includes([:price_tier]) }
  scope :with_basic_attachments, -> { includes([:cover_photo_attachment])
                                      .includes([:profile_pic_attachment]) }
  scope :with_content, -> { includes([:content])
                            .includes([:contents])
                          }


  def name
    "#{first_name} #{last_name}"
  end

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
