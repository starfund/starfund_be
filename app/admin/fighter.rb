ActiveAdmin.register Fighter do
  permit_params :id, :email, :first_name, :last_name, :country, :reach, :height, :organization, :birthdate, images: []


  show do
    attributes_table do
      row :first_name
      row :last_name
      row :country
      row :reach
      row :height
      row :birthdate
      row :organization
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
    input :birthdate
    input :organization
    f.inputs do
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end
end
