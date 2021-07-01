json.extract! business, :id, :name, :country, :birthdate, :slogan

json.sub_price business.price_by_geo(geo)

json.partial! 'api/v1/courses/by_business', courses: business.courses
json.partial! 'api/v1/businesses/attachments', business: business

json.content do
  json.array! business.business_contents do |content|
    json.id content.id
    json.title content.title
    json.business_id content.business.id
    json.name content.business.name
    json.description content.description
    json.title_ru content.title_ru
    json.description_ru content.description_ru
    json.title_es content.title_es
    json.description_es content.description_es
    json.event_date content.event_date
    if content.image.attached?
      json.image polymorphic_url(content.image)
    end
    if content.video.attached?
      json.video polymorphic_url(content.video)
      if content.video_thumbnail.attached?
        json.thumbnail polymorphic_url(content.video_thumbnail)
      end
    end
  end
end