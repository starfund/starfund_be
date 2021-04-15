json.array! @subscriptions do |subscription|
  json.extract! subscription, :id, :last_charge, :last_charge_date, :status
  json.fighter_picture polymorphic_url(subscription.fighter.profile_pic)

  json.user do
    json.partial! 'api/v1/users/info', user: subscription.user
  end
  json.fighter do
    json.partial! 'api/v1/fighters/info', fighter: subscription.fighter
  end
  
  json.content subscription.fighter.contents do |content|
    json.extract! content, :title, :description, :event_date
    json.image polymorphic_url(content.image) if content.image.attached?
    json.video polymorphic_url(content.video) if content.video.attached?
  end
end
