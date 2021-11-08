ActiveAdmin.register Organization do
  permit_params :id, :name, :price_tier_id, :ppv_price
end
