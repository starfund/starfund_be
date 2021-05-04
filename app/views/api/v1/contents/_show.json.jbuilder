json.title content.title
json.description content.description
json.title_ru content.title_ru
json.description_ru content.description_ru
json.title_es content.title_es
json.description_es content.description_es
json.publish_date content.event_date
if content.image.attached?
  json.image polymorphic_url(content.image)
end
if content.video.attached?
  json.video polymorphic_url(content.video)
end
