json.merch do
    json.array! organization.merch_items do |merch_item|
      json.extract! merch_item, :id, :name, :product_type, :price, :amount_xs, :amount_s, :amount_m, :amount_l, 
                  :amount_xl, :width, :length
      json.photo polymorphic_url(merch_item.photo)
    end
  end
  