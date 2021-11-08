# == Schema Information
#
# Table name: org_events
#
#  id              :bigint           not null, primary key
#  name            :string
#  organization_id :bigint           not null
#  description     :string
#  event_date      :date
#
# Indexes
#
#  index_org_events_on_organization_id  (organization_id)
#
class OrgEvent < ApplicationRecord
  belongs_to :organization
end
