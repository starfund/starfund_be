ActiveAdmin.register Content do
  permit_params :id, :title, :event_date, :description,
                :fighter_id, :image, :video, :public

  show do
    attributes_table do
      row :id
      row :fighter
      row :title
      row :event_date
      row :description
      row :public
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
    input :public
    f.input :image, as: :file, input_html: { direct_upload: true }
    f.input :video, as: :file, input_html: { direct_upload: true }

    f.actions
  end
end
