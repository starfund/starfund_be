json.charge do
  json.id         @charge&.id
  json.user       @charge&.user_id
  json.fighter    @charge&.fighter
  json.reason     @charge&.reason
  json.referal_code @charge&.referal_code
  json.newbie     @newbie
  json.should_update_password @should_update_password
  json.user @user
end
