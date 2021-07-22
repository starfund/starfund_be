json.extract! content, :id, :title, :feed, :description, :title_ru, :description_ru, :title_es, :description_es, :event_date

if content.fighter.team
  json.team_name content.fighter.team.name
end
json.fighter_id content.fighter.id
json.first_name content.fighter.first_name
json.last_name content.fighter.last_name
json.likes content.total_likes

if content.image.attached?
  json.image cache_url(content.image)
end
if content.video.attached?
  json.video cache_url(content.video)
  if content.video_thumbnail.attached?
    json.thumbnail cache_url(content.video_thumbnail)
  end
end
