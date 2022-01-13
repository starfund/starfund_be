class OrgEventChannel < ApplicationCable::Channel
  def subscribed
    org_event = OrgEvent.find(params[:org_event_id])
    stream_for(org_event)
  end

  def unsubscribed; end
end