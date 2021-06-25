ActiveAdmin.register CourseSchedule do
  permit_params :id, :start_hour, :end_hour, :week_day,
                :course_id
end