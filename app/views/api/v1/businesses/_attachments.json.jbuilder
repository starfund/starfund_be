json.profile_picture polymorphic_url(business.profile_pic)
json.cover_photo polymorphic_url(business.cover_photo)
if business.official_preview.attached?
  json.official_preview polymorphic_url(business.official_preview)
end