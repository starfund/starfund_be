json.user do
  json.partial! 'info', user: current_user
  json.newbie @newbie
  json.should_update_password @should_update_password
end
