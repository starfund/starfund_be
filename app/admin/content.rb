ActiveAdmin.register Content do
  permit_params :id, :title, :event_date, :description,
                :fighter_id, :image, :video, :public, :published,
                :feed, :title_ru, :title_es, :description_ru,
                :description_es

  index do
    column :id
    column :title
    column :description
    column :title_ru
    column :description_ru
    column :title_es
    column :description_es
    column :event_date
    column :public
    column :feed
    column :published

    actions
  end

  show do
    attributes_table do
      row :id
      row :fighter
      row :title
      row :title_ru
      row :event_date
      row :description
      row :description_ru
      row :public
      row :feed
      row :published
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
    input :title_ru
    input :description_ru
    input :title_es
    input :description_es
    input :fighter
    input :event_date
    input :public
    input :feed
    f.input :image, as: :file, input_html: { direct_upload: true }
    f.input :video, as: :file, input_html: { direct_upload: true }

    f.actions
  end
end
