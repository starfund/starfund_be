# == Schema Information
#
# Table name: orders
#
#  id            :bigint           not null, primary key
#  region        :string
#  city          :string
#  address       :string
#  zip_code      :string
#  size          :string
#  amount        :integer
#  merch_item_id :bigint           not null
#
# Indexes
#
#  index_orders_on_merch_item_id  (merch_item_id)
#
class Order < ApplicationRecord
    belongs_to :merch_item
end
