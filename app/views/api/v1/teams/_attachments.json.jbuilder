json.profile_picture cache_url(team.profile_pic)
json.cover_photo cache_url(team.cover_photo)
if team.content
  json.official_preview cache_url(team.content.video)
else
  json.official_preview team.preview_url
end