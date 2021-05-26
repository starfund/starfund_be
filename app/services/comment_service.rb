module CommentService
  extend self
  def create_message(content, msg, user)
    message = user.comments.create!(content: content, message: msg)
    broadcast_message(content, message)
    message
  end

  private

  def broadcast_message(content, message)
    message_data = form_message_data(message)
    CommentsChannel.broadcast_to(content, message_data)
  end

  def form_message_data(comment)
    user = comment.user
    {
      action: 'new_message',
      content: comment.message,
      user: user.username,
      user_id: user.id,
      date: Time.zone.now.iso8601
    }
  end
end