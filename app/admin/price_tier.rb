ActiveAdmin.register PriceTier do
  permit_params :id, :level, :us, :ru, :name, :stripe_id, :originator, :stripe_id_annual, :us_annual

  show do
    attributes_table do
      row :id
      row :name
      row :level
      row :stripe_id
      row :stripe_id_annual
      row :originator
      row "Dollars Monthly" do |p|
        p.us
      end
      row "Dollars Annual" do |p|
        p.us_annual
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
    input :stripe_id_annual
    input :originator
    input :us
    input :us_annual
    input :ru

    f.actions
  end
end
