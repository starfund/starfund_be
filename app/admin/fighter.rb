ActiveAdmin.register Fighter do
  permit_params :id, :email, :first_name, :last_name, :country, :reach, :height, :organization,
                :birthdate, :cover_photo, :profile_pic, :preview_url, :price_tier_id,
                public_videos: [], private_videos: []


  index do
    column :id
    column :first_name
    column :last_name
    column :country
    column :reach
    column :height
    column :birthdate
    column :organization
    column :price_tier
    column :preview_url

    actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :country
      row :reach
      row :height
      row :price_tier
      row :birthdate
      row :organization
      row "Profile Picture" do |p|
        image_tag(url_for(p.profile_pic), size: "200x200")
      end
      row "Cover Photo" do |p|
        image_tag(url_for(p.cover_photo), size: "200x200")
      end
      row "Previews" do |p|
        ul do
          p.public_videos.each do |video|
            li do
              video_tag(url_for(video), size: "200x200")
            end
          end
        end
      end
      row "Private content" do |p|
        ul do
          p.private_videos.each do |video|
            li do
              video_tag(url_for(video), size: "200x200")
            end
          end
        end
      end
    end
  end

  form multipart: true, direct_upload: true do |f|
    input :first_name
    input :last_name
    input :country
    input :reach
    input :height
    input :price_tier, include_blank: false
    input :birthdate, start_year: 1900
    input :organization
    input :preview_url
    f.input :cover_photo, as: :file
    f.input :profile_pic, as: :file
    f.inputs do
      f.input :public_videos, as: :file, input_html: { multiple: true, direct_upload: true }
    end
    if f.object.public_videos.attached?
      f.object.public_videos.each do |video|
        span do
          video_tag(url_for(video), size: "200x200")
        end
      end
    end
    f.inputs do
      f.input :private_videos, as: :file, input_html: { multiple: true, direct_upload: true }
    end
    if f.object.private_videos.attached?
      f.object.private_videos.each do |video|
        span do
          video_tag(url_for(video), size: "200x200")
        end
      end
    end
    f.actions
  end
end
