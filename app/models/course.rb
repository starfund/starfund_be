# == Schema Information
#
# Table name: courses
#
#  id             :bigint           not null, primary key
#  name           :string
#  level          :string
#  course_goal    :string
#  course_type    :integer
#  business_id    :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  name_ru        :string
#  name_es        :string
#  course_goal_ru :string
#  course_goal_es :string
#
# Indexes
#
#  index_courses_on_business_id  (business_id)
#
class Course < ApplicationRecord
  enum course_type: [:free_weights, :fitness, :fighting]

  belongs_to :business
  has_many :course_schedules

  has_one_attached :cover_photo
end
