json.main_events organization.org_events.filter{|e| e.main == true} do |attachment|
  json.partial! 'api/v1/contents/show', content: attachment
end
json.prelim_events organization.org_events.filter{|e| e.prelim == true} do |attachment|
  json.partial! 'api/v1/contents/show', content: attachment
end

