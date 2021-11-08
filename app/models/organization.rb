# == Schema Information
#
# Table name: organizations
#
#  id            :bigint           not null, primary key
#  name          :string
#  monthly_price :integer
#
class Organization < ApplicationRecord

 def price_by_geo(geo)
    monthly_price
  end 
end
