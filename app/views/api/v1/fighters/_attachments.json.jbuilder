json.profile_picture polymorphic_url(fighter.profile_pic)
json.cover_photo polymorphic_url(fighter.cover_photo)
if fighter.content
  json.official_preview polymorphic_url(fighter.content.video)
end
