json.courses do
  json.array! courses do |course|
    json.extract! course, :id, :name, :level, :course_goal, :course_type

    if course.cover_photo.attached?
      json.cover polymorphic_url(course.cover_photo)
    end
  end
end