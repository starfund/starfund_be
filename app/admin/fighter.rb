ActiveAdmin.register Fighter do
  permit_params :id, :email, :first_name, :last_name, :country, :reach, :height, :organization,
                :birthdate, :cover_photo, :profile_pic, :preview_url, :price_tier_id, :team_id,
                :url_name, :content_id, :support, public_videos: [], private_videos: []

  member_action :delete_content, method: :put do
    @pic = ActiveStorage::Attachment.find(params[:pic_id])
    @pic.purge_later
    redirect_backwards_or_to_root
  end

  index do
    column :id
    column :team
    column :first_name
    column :last_name
    column :country
    column :reach
    column :height
    column :birthdate
    column :organization
    column :price_tier
    column :support
    column :preview_url

    actions
  end

  show do
    attributes_table do
      row :team
      row :url_name
      row :first_name
      row :last_name
      row :country
      row :reach
      row :height
      row :price_tier
      row :support
      row :birthdate
      row :organization
      row "Profile Picture" do |p|
        image_tag(url_for(p.profile_pic), size: "200x200")
      end
      row "Cover Photo" do |p|
        image_tag(url_for(p.cover_photo), size: "200x200")
      end
      row "Official Preview" do |p|
        if p.content
          video_tag(url_for(p.content.video), size: "200x200")
        end
      end
    end
  end

  form multipart: true, direct_upload: true do |f|
    input :team, as: :select, collection: Team.all
    input :url_name
    input :first_name
    input :last_name
    input :country
    input :reach
    input :height
    input :price_tier, include_blank: false
    input :birthdate, start_year: 1970
    input :organization
    input :preview_url
    input :support, label: 'Likes support word'
    f.input :cover_photo, as: :file
    f.input :profile_pic, as: :file
    input :content, as: :select, collection: resource.contents, label: 'Presentation'
    f.actions
  end
end
