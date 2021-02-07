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
#  birthdate    :datetime
#  organization :string
#
class Fighter < ApplicationRecord
  has_many_attached :images
end
