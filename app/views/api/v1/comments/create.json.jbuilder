json.comment do
  json.id @comment.id
  json.user_id @comment.user_id
  json.user_name @comment.user.full_name
  json.content_id @comment.content_id
  json.message @comment.message
end
