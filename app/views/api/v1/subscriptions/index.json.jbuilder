json.array! @subscriptions do |subscription|
  json.extract! subscription, :id, :fighter, :user, :last_charge, :last_charge_date
  json.fighter_picture polymorphic_url(subscription.fighter.profile_pic)
  
  json.content subscription.fighter.contents do |content|
    json.extract! content, :title, :description, :event_date
    json.image polymorphic_url(content.image) if content.image.attached?
    json.video polymorphic_url(content.video) if content.video.attached?
  end
end
