json.extract! business, :id, :name, :country, :birthdate, :slogan

json.sub_price business.price_by_geo(geo)

json.partial! 'api/v1/courses/by_business', courses: business.courses
json.partial! 'api/v1/businesses/attachments', business: business