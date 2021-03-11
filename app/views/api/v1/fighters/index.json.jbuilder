json.array! @fighters do |fighter|
  json.extract! fighter, :id, :first_name, :last_name, :country, :reach, :height, :birthdate, :organization, :preview_url, :sub_price
  json.profile_picture polymorphic_url(fighter.profile_pic)
  json.cover_photo polymorphic_url(fighter.cover_photo)
  json.attachments fighter.images do |attachment|
    json.filename attachment.filename
    json.url polymorphic_url(attachment)
  end
end
