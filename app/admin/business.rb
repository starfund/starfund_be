ActiveAdmin.register Business do
  permit_params :id, :name, :country, :birthdate,
                :category, :price_tier_id, :content_id,
                :cover_photo, :profile_pic, :official_preview,
                :slogan, :facebook_link


  show do
    attributes_table do
      row :name
      row :country
      row :birthdate
      row :category
      row :price_tier
      row :facebook_link
      row :slogan
      
      row "Profile Picture" do |p|
        image_tag(url_for(p.profile_pic), size: "200x200")
      end
      row "Cover Photo" do |p|
        image_tag(url_for(p.cover_photo), size: "200x200")
      end
      row "Official Preview" do |p|
        if p.official_preview
          video_tag(url_for(p.official_preview), size: "200x200")
        end
      end
    end
  end

  form multipart: true, direct_upload: true do |f|
    input :name
    input :slogan
    input :country
    input :price_tier, include_blank: false
    input :birthdate, start_year: 1970
    input :facebook_link
    f.input :cover_photo, as: :file
    f.input :profile_pic, as: :file
    f.input :official_preview, as: :file, input_html: { direct_upload: true }
    f.actions
  end
end