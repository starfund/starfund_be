json.credit_card do
  json.id         @card&.id
  json.brand      @card&.brand
  json.last4      @card&.last4
end
