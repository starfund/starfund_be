json.extract! team, :id, :name, :country, :preview_url

json.sub_price team.price_by_geo(geo)

json.partial! 'api/v1/teams/attachments', team: team

if content
  json.array! team.fighters do |fighter|
    json.public_videos do
      fighter.contents.filter{|c| c.public == true} do |attachment|
        json.partial! 'api/v1/contents/show', content: attachment
      end
    end
    json.private_videos do
      fighter.contents.filter{|c| c.public == false} do |attachment|
        json.partial! 'api/v1/contents/show', content: attachment
      end
    end
  end
end
