class Content < ApplicationRecord
  belongs_to :fighter

  has_one_attached :image
  has_one_attached :video
end
