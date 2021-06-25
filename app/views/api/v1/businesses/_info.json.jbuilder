json.extract! business, :id, :name, :country, :birthdate

json.sub_price business.price_by_geo(geo)

json.partial! 'api/v1/business/attachments', business: business