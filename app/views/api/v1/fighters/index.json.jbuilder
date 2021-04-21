json.array! @fighters do |fighter|
  json.fighter json.partial! 'info', fighter: fighter
end
