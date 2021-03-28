ActiveAdmin.register Content do
  permit_params :id, :title, :event_date, :description, :fighter_id, :image, :video

  show do
    attributes_table do
      row :id
      row :fighter
      row :title
      row :event_date
      row :description
      row "Image" do |c|
        image_tag(url_for(c.image), size: "200x200") if c.image.attached?
      end
      row "Video" do |c|
        video_tag(url_for(c.video), size: "200x200") if c.video.attached?
      end
    end
  end

  form do |f|
    input :title
    input :description
    input :fighter
    input :event_date
    f.input :image, as: :file
    f.input :video, as: :file

    f.actions
  end
end
