# == Schema Information
#
# Table name: org_events
#
#  id              :bigint           not null, primary key
#  name            :string
#  organization_id :bigint           not null
#  description     :string
#  event_date      :datetime
#  stream_link     :string
#  finished        :boolean          default(FALSE)
#  home_page       :boolean          default(FALSE)
#
# Indexes
#
#  index_org_events_on_organization_id  (organization_id)
#
class OrgEvent < ApplicationRecord
  belongs_to :organization
  has_many :org_contents

  has_one_attached :cover_photo
end
