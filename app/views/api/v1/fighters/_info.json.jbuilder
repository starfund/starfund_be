json.extract! fighter, :id, :first_name, :last_name, :country, :reach, :height, :birthdate, :organization, :preview_url

json.sub_price fighter.price_by_geo(geo)

json.partial! 'api/v1/fighters/attachments', fighter: fighter
