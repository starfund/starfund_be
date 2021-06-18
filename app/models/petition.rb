# == Schema Information
#
# Table name: petitions
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  topic       :integer
#  requester   :string
#  receiver    :string
#  explanation :string
#
# Indexes
#
#  index_petitions_on_user_id  (user_id)
#
class Petition < ApplicationRecord
  enum topic: [:ppv]
  
  belongs_to :user
end
