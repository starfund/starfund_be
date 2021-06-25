ActiveAdmin.register Course do
  permit_params :id, :name, :course_type, :business_id,
                :course_goal, :level
end