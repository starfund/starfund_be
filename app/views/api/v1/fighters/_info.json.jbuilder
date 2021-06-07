json.extract! fighter, :id, :first_name, :last_name, :country, :reach, :height, :birthdate, :organization, :preview_url

json.sub_price fighter.price_by_geo(geo)

json.partial! 'api/v1/fighters/attachments', fighter: fighter

if content
  json.public_videos fighter.contents.filter{|c| c.public == true} do |attachment|
    json.partial! 'api/v1/contents/show', content: attachment
  end
  json.private_videos fighter.contents.filter{|c| c.public == false} do |attachment|
    json.partial! 'api/v1/contents/show', content: attachment
  end
end
