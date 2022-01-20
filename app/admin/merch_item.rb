ActiveAdmin.register MerchItem do
    permit_params :id, :name, :product_type, :price, :organization_id, :amount_xs, :amount_s, :amount_m, :amount_l, 
                  :amount_xl, :width, :length, :photo

    
    index do
        column :id
        column :name
        column :product_type
        column :price
        column :organization
        column :amount_xs
        column :amount_s
        column :amount_m
        column :amount_l
        column :amount_xl
        column :width
        column :length 
        
        actions
    end

    show do
        attributes_table do
          row :id
          row :name
          row :product_type
          row :price
          row :organization
          row :amount_xs
          row :amount_s
          row :amount_m
          row :amount_l
          row :amount_xl
          row :width
          row :length
          row "Photo" do |p|
            image_tag(url_for(p.photo), size: "200x200")
          end
        end
    end
   
    form multipart: true, direct_upload: true do |f|
        input :name
        input :product_type
        input :price
        input :organization
        input :amount_xs
        input :amount_s
        input :amount_m
        input :amount_l
        input :amount_xl
        input :width
        input :length
        f.input :photo, as: :file
        f.actions
    end

end