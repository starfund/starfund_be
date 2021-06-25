json.array! @businesses do |business|
  json.business json.partial! 'info', business: business
end
