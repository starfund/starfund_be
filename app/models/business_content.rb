# == Schema Information
#
# Table name: business_contents
#
#  id             :bigint           not null, primary key
#  business_id    :bigint           not null
#  title          :string
#  description    :string
#  event_date     :date
#  public         :boolean
#  published      :boolean
#  title_ru       :string
#  description_ru :string
#  title_es       :string
#  description_es :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_business_contents_on_business_id  (business_id)
#
class BusinessContent < ApplicationRecord
  belongs_to :business
  has_many :tags, as: :taggable

  accepts_nested_attributes_for :tags, allow_destroy: true

  has_one_attached :image
  has_one_attached :video
  has_one_attached :video_thumbnail

  def self.tags
    %w(power coordination endurance velocity force explode)
  end
end
