json.extract! organization, :id, :name, :ppv_price

json.sub_price organization.price_by_geo(geo)
