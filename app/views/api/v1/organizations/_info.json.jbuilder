json.extract! organization, :id, :name, :ppv_price

json.sub_price organization.price_by_geo(geo)
json.partial! 'api/v1/organizations/attachments', organization: organization
json.partial! 'api/v1/organizations/events', organization: organization
