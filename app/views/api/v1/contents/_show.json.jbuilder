json.id content.id
json.title content.title
if content.fighter.team
  json.team_name content.fighter.team.name
end
json.fighter_id content.fighter.id
json.first_name content.fighter.first_name
json.last_name content.fighter.last_name
json.likes content.total_likes
json.feed content.feed
json.description content.description
json.title_ru content.title_ru
json.description_ru content.description_ru
json.title_es content.title_es
json.description_es content.description_es
json.event_date content.event_date
if content.image.attached?
  json.image cache_url(content.image)
end
if content.video.attached?
  json.video cache_url(content.video)
  if content.video_thumbnail.attached?
    json.thumbnail cache_url(content.video_thumbnail)
  end
end
