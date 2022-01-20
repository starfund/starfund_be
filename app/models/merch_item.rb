# == Schema Information
#
# Table name: merch_items
#
#  id              :bigint           not null, primary key
#  name            :string
#  product_type    :string
#  price           :integer
#  amount_xs       :integer
#  amount_s        :integer
#  amount_m        :integer
#  amount_l        :integer
#  amount_xl       :integer
#  width           :integer
#  length          :integer
#  organization_id :bigint
#
# Indexes
#
#  index_merch_items_on_organization_id  (organization_id)
#
class MerchItem < ApplicationRecord
    belongs_to :organization
    has_one_attached :photo

    scope :with_basic_attachments, -> {includes([:photo_attachment])}
end
