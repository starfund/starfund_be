json.array! @payments do |payment|
  json.id         payment&.id
  json.amount     payment&.amount
  json.concept    payment&.concept
end
