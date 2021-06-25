ActiveAdmin.register Business do
  permit_params :id, :name, :country, :birthdate,
                :category, :price_tier_id, :content_id
end