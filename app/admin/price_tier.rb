ActiveAdmin.register PriceTier do
  permit_params :id, :level, :us, :ru, :name, :stripe_id

  show do
    attributes_table do
      row :id
      row :name
      row :level
      row :stripe_id
      row "Dollars" do |p|
        p.us
      end
      row "Rubles" do |p|
        p.ru
      end
    end
  end

  form do |f|
    input :level
    input :name
    input :stripe_id
    input :us
    input :ru

    f.actions
  end
end
