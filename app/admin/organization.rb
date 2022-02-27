ActiveAdmin.register Organization do
  permit_params :id, :name, :price_tier_id, :ppv_price, :yearly_discount, :organization_icon, cover_photos: [], mobile_cover_photos: []

  show do
    attributes_table do
      row :id
      row :name
      row :price_tier
      row :ppv_price
      row :yearly_discount
    end
  end

  form multipart: true, direct_upload: true do |f|
    input :name
    input :price_tier, include_blank: false
    input :ppv_price
    f.input :organization_icon, as: :file
    f.input :cover_photos, as: :file, input_html: { multiple: true }
    f.input :mobile_cover_photos, as: :file, input_html: { multiple: true }
    f.actions
  end
end
