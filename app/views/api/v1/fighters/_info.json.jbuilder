json.extract! fighter, :id, :first_name, :last_name, :country, :reach, :height, :birthdate, :organization, :preview_url

json.sub_price fighter.price_tier.us

json.partial! 'api/v1/fighters/attachments', fighter: fighter

json.attachments fighter.images do |attachment|
  json.filename attachment.filename
  json.url polymorphic_url(attachment)
end
json.public_videos fighter.public_videos do |attachment|
  json.filename attachment.filename
  json.url polymorphic_url(attachment)
end
json.private_videos fighter.public_videos do |attachment|
  json.filename attachment.filename
  json.url polymorphic_url(attachment)
end