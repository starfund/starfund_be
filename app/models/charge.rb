# == Schema Information
#
# Table name: charges
#
#  id            :bigint           not null, primary key
#  user_id       :bigint           not null
#  fighter_id    :bigint
#  reason        :string
#  amount        :integer
#  org_events_id :bigint
#
# Indexes
#
#  index_charges_on_fighter_id     (fighter_id)
#  index_charges_on_org_events_id  (org_events_id)
#  index_charges_on_user_id        (user_id)
#
class Charge < ApplicationRecord
  belongs_to :user
  belongs_to :fighter, optional: true
  belongs_to :org_event, optional: true
end
