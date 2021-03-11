# == Schema Information
#
# Table name: fighters
#
#  id           :bigint           not null, primary key
#  first_name   :string
#  last_name    :string
#  country      :string
#  reach        :float
#  height       :integer
#  birthdate    :date
#  organization :string
#  preview_url  :string
#  sub_price    :integer
#
class Fighter < ApplicationRecord
  has_many_attached :images
  has_one_attached :cover_photo
  has_one_attached :profile_pic
end
