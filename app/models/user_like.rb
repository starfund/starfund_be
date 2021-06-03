# == Schema Information
#
# Table name: user_likes
#
#  id         :bigint           not null, primary key
#  content_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_user_likes_on_content_id  (content_id)
#  index_user_likes_on_user_id     (user_id)
#
class UserLike < ApplicationRecord
  belongs_to :user
  belongs_to :content
end
