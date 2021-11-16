json.extract! content, :id, :title, :feed, :description, :title_ru, :description_ru, :title_es, :description_es, :event_date, :is_live

if content.image.attached?
  json.image cache_url(content.image)
end
if content.video.attached?
  json.video cache_url(content.video)
  if content.video_thumbnail.attached?
    json.thumbnail cache_url(content.video_thumbnail)
  end
end
