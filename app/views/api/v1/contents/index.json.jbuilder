json.content do
  json.array! @public_content do |content|
    json.exclusive false
    json.partial! 'api/v1/contents/show', content: content
    json.partial! 'api/v1/fighters/attachments', fighter: content.fighter
  end
  json.array! @private_content do |content|
    json.exclusive true
    json.partial! 'api/v1/contents/show', content: content
    json.partial! 'api/v1/fighters/attachments', fighter: content.fighter
  end
end
json.likes do
  json.array! @user_likes do |like|
    json.user like.user.id
    json.content like.content.id
  end
end