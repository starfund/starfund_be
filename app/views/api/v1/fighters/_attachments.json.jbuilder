json.cache! ['v1', fighter], expires_in: 1.week do
  json.profile_picture cache_url(fighter.profile_pic)
  json.cover_photo cache_url(fighter.cover_photo)
end

if fighter.content
  json.official_preview cache_url(fighter.content.video)
end
