json.title content.title
json.description content.description
json.publish_date content.event_date
if content.image.attached?
  json.image polymorphic_url(content.image)
end
if content.video.attached?
  json.video polymorphic_url(content.video)
end
