ActiveAdmin.register Organization do
  permit_params :id, :name, :price_tier_id, :ppv_price, :cover_photo

  show do
    attributes_table do
      row :id
      row :name
      row :price_tier
      row :ppv_price
      row "Cover Photo" do |p|
        if p.cover_photo.attached?
          image_tag(url_for(p.cover_photo), size: "200x200")
        end
      end
    end
  end

  form multipart: true, direct_upload: true do |f|
    input :name
    input :price_tier, include_blank: false
    input :ppv_price
    f.input :cover_photo, as: :file
    f.actions
  end
end
