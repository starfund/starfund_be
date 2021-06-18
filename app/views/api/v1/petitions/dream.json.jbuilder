json.petition do
  json.id           @petition&.id
  json.topic        @petition&.topic
  json.requester    @petition&.requester
  json.receiver     @petition&.receiver
  json.explanation  @petition&.explanation
end
