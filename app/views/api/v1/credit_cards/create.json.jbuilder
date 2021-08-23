json.credit_card do
  json.cardId     @card&.id
  json.brand      @card&.brand
  json.last4      @card&.last4
end
