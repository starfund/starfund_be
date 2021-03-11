ActiveAdmin.register Fighter do
  permit_params :id, :email, :first_name, :last_name, :country, :reach, :height, :organization,
                :birthdate, :cover_photo, :profile_pic, :preview_url, images: []


  show do
    attributes_table do
      row :first_name
      row :last_name
      row :country
      row :reach
      row :height
      row :birthdate
      row :organization
      row "Profile Picture" do |p|
        image_tag url_for(p.profile_pic)
      end
      row "Cover Photo" do |p|
        image_tag url_for(p.cover_photo)
      end
      row "Images" do |p|
        ul do
          p.images.each do |photo|
            li do
              image_tag url_for(photo)
            end
          end
        end
      end
    end
  end

  form do |f|
    input :first_name
    input :last_name
    input :country
    input :reach
    input :height
    input :sub_price
    input :birthdate, start_year: 1900
    input :organization
    input :preview_url
    f.input :cover_photo, as: :file
    f.input :profile_pic, as: :file
    f.inputs do
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end
end
