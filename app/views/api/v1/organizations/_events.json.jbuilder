json.events do
  json.array! organization.org_events do |event|
    json.main_events event.org_contents.filter{|e| e.main_event == true} do |attachment|
      json.partial! 'api/v1/contents/show', content: attachment
    end
    json.prelim_events event.org_contents.filter{|e| e.main_event == false} do |attachment|
      json.partial! 'api/v1/contents/show', content: attachment
    end
  end
end
