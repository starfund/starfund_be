json.events do
  json.array! organization.org_events do |event|
    json.extract! event, :id, :name, :description, :event_date, :stream_link, :finished, :home_page, :replay
    json.main_events event.org_contents.filter{|e| e.main_event == true} do |attachment|
      json.partial! 'api/v1/org_contents/show', content: attachment
    end
    json.prelim_events event.org_contents.filter{|e| e.main_event == false} do |attachment|
      json.partial! 'api/v1/org_contents/show', content: attachment
    end
    json.cover_photo polymorphic_url(event.cover_photo) if event.cover_photo.attached?
  end
end
