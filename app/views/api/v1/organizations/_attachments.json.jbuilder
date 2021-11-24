json.cover_photo polymorphic_url(organization.cover_photo)
json.mobile_cover_photo polymorphic_url(organization.mobile_cover_photo) if organization.mobile_cover_photo.attached?

