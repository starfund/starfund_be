ActiveAdmin.register Course do
  permit_params :id, :name, :course_type, :business_id,
                :course_goal, :level, :cover_photo,
                :name_es, :name_ru, :course_goal_es,
                :course_goal_ru

  show do
    attributes_table do
      row :name
      row :course_type
      row :business
      row :course_goal
      row :level
      
      row "Cover Photo" do |p|
        image_tag(url_for(p.cover_photo), size: "200x200")
      end
    end
  end

  form multipart: true, direct_upload: true do |f|
    input :name
    input :name_es
    input :name_ru
    input :course_type
    input :business, as: :select
    input :course_goal
    input :course_goal_es
    input :course_goal_ru
    input :level
    f.input :cover_photo, as: :file
    
    f.actions
  end             
end