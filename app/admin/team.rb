ActiveAdmin.register Team do
  permit_params :id, :name, :country, :cover_photo, :profile_pic, :preview_url,
                :price_tier_id
                

  member_action :delete_content, method: :put do
    @pic = ActiveStorage::Attachment.find(params[:pic_id])
    @pic.purge_later
    redirect_backwards_or_to_root
  end

  index do
    column :id
    column :name
    column :country
    column :price_tier
    column :preview_url

    actions
  end

  show do
    attributes_table do
      row :name
      row :country
      row :price_tier
      row "Profile Picture" do |p|
        image_tag(url_for(p.profile_pic), size: "200x200")
      end
      row "Cover Photo" do |p|
        image_tag(url_for(p.cover_photo), size: "200x200")
      end
    end
  end

  form multipart: true, direct_upload: true do |f|
    input :name
    input :country
    input :price_tier, include_blank: false
    input :preview_url
    f.input :cover_photo, as: :file
    f.input :profile_pic, as: :file
    f.actions
  end
end
