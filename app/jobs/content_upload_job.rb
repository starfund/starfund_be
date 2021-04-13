class ContentUploadJob < ApplicationJob
  queue_as :default

  def perform(content)
    byebug
    content_id = content[:id]
    date = Date.new(content['event_date(1i)'].to_i, content['event_date(2i)'].to_i, content['event_date(3i)'].to_i)
    if(content_id.blank?)
      content = Content.create(
        title: content[:title],
        description: content[:description],
        fighter_id: content[:fighter_id],
        event_date: date,
        public: content[:public]
      )
      content.image.attach(content[:image]) if content[:image]
      content.video.attach(content[:video]) if content[:video]
    else
      content = Content.find(content_id)
    end
  end
end
