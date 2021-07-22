# == Schema Information
#
# Table name: contents
#
#  id               :bigint           not null, primary key
#  fighter_id       :bigint           not null
#  title            :string
#  description      :string
#  event_date       :date
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  public           :boolean          default(TRUE)
#  feed             :boolean          default(TRUE)
#  published        :boolean          default(FALSE)
#  title_ru         :string
#  description_ru   :string
#  title_es         :string
#  description_es   :string
#  fake_likes_count :integer          default(0)
#  likes_count      :bigint           default(0)
#
# Indexes
#
#  index_contents_on_fighter_id  (fighter_id)
#
class Content < ApplicationRecord
  belongs_to :fighter

  has_many :comments

  has_one_attached :image
  has_one_attached :video
  has_one_attached :video_thumbnail

  default_scope { includes([:video_thumbnail_attachment])
                  .includes([:video_attachment])
                  .includes([:image_attachment]) 
                }

  def total_likes
    likes_count + fake_likes_count
  end
end
