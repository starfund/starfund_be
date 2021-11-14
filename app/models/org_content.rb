class OrgContent < ApplicationRecord
  belongs_to :org_event

  has_one_attached :image
  has_one_attached :video
  has_one_attached :video_thumbnail
end
