# == Schema Information
#
# Table name: contents
#
#  id             :bigint           not null, primary key
#  fighter_id     :bigint           not null
#  title          :string
#  description    :string
#  event_date     :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  public         :boolean          default(TRUE)
#  feed           :boolean          default(TRUE)
#  published      :boolean          default(FALSE)
#  title_ru       :string
#  description_ru :string
#  title_es       :string
#  description_es :string
#
# Indexes
#
#  index_contents_on_fighter_id  (fighter_id)
#
class Content < ApplicationRecord
  belongs_to :fighter

  has_one_attached :image
  has_one_attached :video
end
