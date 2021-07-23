json.subscriptions do
  json.array! @subscriptions do |subscription|
    json.extract! subscription, :id, :last_charge, :last_charge_date, :status

    json.user do
      json.partial! 'api/v1/users/info', user: subscription.user
    end
    
    if subscription.fighter
      json.fighter do
        json.partial! 'api/v1/fighters/info', fighter: subscription.fighter, content: true
      end
      json.fighter_picture cache_url(subscription.fighter.profile_pic)
      json.content subscription.fighter.contents.filter{|c| c.public == false } do |content|
        json.extract! content, :title, :description, :event_date, :feed, :title_ru, :title_es, :description_ru, :description_es
        json.likes content.total_likes
        json.image cache_url(content.image) if content.image.attached?
        json.video cache_url(content.video) if content.video.attached?
      end
    end
    
    if subscription.team
      json.team do
        json.partial! 'api/v1/teams/info', team: subscription.team, content: true
      end
      json.fighter_picture cache_url(subscription.team.profile_pic)
      json.content do
        json.array! subscription.team.fighters.map(&:contents).flatten.filter{|c| c.public == false } do |content|
          json.extract! content, :title, :description, :event_date, :feed, :title_ru, :title_es, :description_ru, :description_es
          json.likes content.total_likes
          json.image cache_url(content.image) if content.image.attached?
          json.video cache_url(content.video) if content.video.attached?
        end
      end
    end
  end
end

json.public_content do
  json.array! @public_content do |content|
    json.extract! content, :title, :description, :event_date, :feed, :title_ru, :title_es, :description_ru, :description_es
    json.likes content.total_likes
    json.fighter_id content.fighter.id
    json.fighter_name content.fighter.first_name
    json.partial! 'api/v1/fighters/attachments', fighter: content.fighter
    json.image cache_url(content.image) if content.image.attached?
    json.video cache_url(content.video) if content.video.attached?
  end
end

json.business_subscription do
  json.array! @business_subs do |subscription|
    json.extract! subscription, :id, :last_charge, :last_charge_date, :status, :business_id
  end
end
