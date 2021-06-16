json.charge do
  json.id         @cahrge&.id
  json.user       @cahrge&.user_id
  json.fighter    @cahrge&.fighter
  json.reason     @cahrge&.reason
  json.newbie     @newbie
  json.should_update_password @should_update_password
  json.user @user
end
