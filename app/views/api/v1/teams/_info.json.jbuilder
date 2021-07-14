json.extract! team, :id, :name, :country, :preview_url
json.sub_price team.price_by_geo(geo)
json.official_preview team.preview_url
json.partial! 'api/v1/teams/attachments', team: team

if content && team.fighters.length > 0
  json.fighters do
    json.array! team.fighters do |fighter|
      json.partial! 'api/v1/fighters/info', fighter: fighter, content: true
    end
  end
end
