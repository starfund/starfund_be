json.public_videos fighter.contents.filter{|c| c.public == true} do |attachment|
  json.partial! 'api/v1/contents/show', content: attachment
end
json.private_videos fighter.contents.filter{|c| c.public == false} do |attachment|
  json.partial! 'api/v1/contents/show', content: attachment
end
