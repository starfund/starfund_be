json.extract! business, :id, :name, :country, :birthdate, :slogan

json.sub_price business.price_by_geo(geo)

json.partial! 'api/v1/courses/by_business', courses: business.courses
json.partial! 'api/v1/businesses/attachments', business: business

json.content do
  json.array! business.business_contents do |content|
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