json.array! @subscriptions do |subscription|
  json.extract! subscription, :id, :fighter, :user, :last_charge, :last_charge_date
  json.fighter_picture polymorphic_url(subscription.fighter.profile_pic)
end
