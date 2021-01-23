json.payment do
  json.id         @payment&.id
  json.amount     @payment&.amount
  json.concept    @payment&.concept
end
