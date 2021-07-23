# == Schema Information
#
# Table name: tags
#
#  id            :bigint           not null, primary key
#  taggable_type :string
#  taggable_id   :bigint
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_tags_on_taggable_type_and_taggable_id  (taggable_type,taggable_id)
#
class Tag < ApplicationRecord
  belongs_to :taggable, polymorphic: true
end
