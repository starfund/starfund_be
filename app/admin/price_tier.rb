ActiveAdmin.register PriceTier do
  permit_params :id, :level, :us, :ru

  show do
    attributes_table do
      row :id
      row :level
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
    input :us
    input :ru

    f.actions
  end
end
