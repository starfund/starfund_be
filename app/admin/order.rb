ActiveAdmin.register Order do
    permit_params :region, :city, :address, :zip_code, :size, :amount, :merch_item_id

    index do
        column :id
        column :region
        column :city
        column :address
        column :zip_code
        column :size
        column :amount
        column :merch_item

        actions
    end

    show do
        attributes_table do
            row :id
            row :region
            row :city
            row :address
            row :zip_code
            row :size
            row :amount
            row :merch_item
        end
    end

    form do |f|
        input :region
        input :city
        input :address
        input :zip_code
        input :size
        input :amount
        input :merch_item
        
        f.actions
    end
end