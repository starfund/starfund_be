json.array! @fighters do |fighter|
  json.fighter json.partial! 'info', fighter: fighter, req_geo: @geo
end
