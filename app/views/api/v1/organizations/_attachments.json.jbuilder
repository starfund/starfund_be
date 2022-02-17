json.organization_icon polymorphic_url(organization.organization_icon) if organization.organization_icon.attached?
json.cover_photos do
    json.array! organization.cover_photos.attachments().map{|img| ({ image: polymorphic_url(img) })}
end
json.mobile_cover_photos do
    json.array! organization.mobile_cover_photos.attachments().map{|img| ({ image: polymorphic_url(img) })}
end
