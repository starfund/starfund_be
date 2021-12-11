# == Schema Information
#
# Table name: org_contents
#
#  id                 :bigint           not null, primary key
#  org_event_id       :bigint           not null
#  title              :string
#  title_ru           :string
#  description        :string
#  description_ru     :string
#  title_es           :string
#  description_es     :string
#  public             :boolean
#  event_date         :datetime
#  published          :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  main_event         :boolean          default(FALSE)
#  feed               :boolean          default(FALSE)
#  is_live            :boolean          default(FALSE)
#  fighter_1          :string
#  fighter_2          :string
#  winner             :string
#  video_url          :string
#  division           :string
#  rounds             :integer
#  result_description :string
#
# Indexes
#
#  index_org_contents_on_org_event_id  (org_event_id)
#
class OrgContent < ApplicationRecord
  belongs_to :org_event

  has_one_attached :image
  has_one_attached :video
  has_one_attached :video_thumbnail
end
