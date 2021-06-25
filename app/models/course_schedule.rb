# == Schema Information
#
# Table name: course_schedules
#
#  id         :bigint           not null, primary key
#  week_day   :integer
#  start_hour :time
#  end_hour   :time
#  course_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_course_schedules_on_course_id  (course_id)
#
class CourseSchedule < ApplicationRecord
  belongs_to :course
end
