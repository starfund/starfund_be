class CommentsChannel < ApplicationCable::Channel
  def subscribed
    content = Content.find(params[:content_id])
    stream_for(content)
  end

  def unsubscribed; end
end