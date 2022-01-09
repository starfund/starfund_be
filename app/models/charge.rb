# == Schema Information
#
# Table name: charges
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  fighter_id   :bigint
#  reason       :string
#  amount       :integer
#  org_event_id :bigint
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_charges_on_fighter_id    (fighter_id)
#  index_charges_on_org_event_id  (org_event_id)
#  index_charges_on_user_id       (user_id)
#
class Charge < ApplicationRecord
  after_create :ppv_email, if: -> { reason == 'ppv' }

  belongs_to :user
  belongs_to :fighter, optional: true
  belongs_to :org_event, optional: true

  def ppv_email
    UserMailer.with(
      user: user_id,
      organization: org_event.organization.id
    ).welcome_ppv.deliver_later
  end
end
