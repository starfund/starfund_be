json.courses do
  json.array! courses do |course|
    json.extract! course, :id, :name, :name_es, :name_ru, :level, :course_goal, :course_goal_es, :course_goal_ru, :course_type

    if course.cover_photo.attached?
      json.cover polymorphic_url(course.cover_photo)
    end
  end
end