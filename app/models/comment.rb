# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  content_id :bigint           not null
#  message    :string
#
# Indexes
#
#  index_comments_on_content_id  (content_id)
#  index_comments_on_user_id     (user_id)
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :content
end
