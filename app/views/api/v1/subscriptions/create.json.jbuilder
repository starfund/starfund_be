json.subscription do
  json.id         @subscription&.id
  json.user       @subscription&.user_id
  json.fighter    @subscription&.fighter
  json.team       @subscription&.team
  json.status     @subscription&.status
  json.referal_code @subscription&.referal_code
  json.last_charge @subscription&.last_charge
  json.last_charge_date @subscription&.last_charge_date
  json.newbie     @newbie
  json.should_update_password @should_update_password
  json.user @user
end
