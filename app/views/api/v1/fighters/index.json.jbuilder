json.array! @fighters do |fighter|
  json.extract! fighter, :id, :first_name, :last_name, :country, :reach, :height, :birthdate, :organization
  json.attachments fighter.images do |attachment|
    json.filename attachment.filename
    json.url polymorphic_url(attachment)
  end
end
