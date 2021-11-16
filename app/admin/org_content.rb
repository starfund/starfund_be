ActiveAdmin.register OrgContent do
  permit_params :id, :title, :event_date, :description, :feed,
                :org_event_id, :image, :video, :public, :published,
                :title_ru, :title_es, :description_ru, :main_event,
                :description_es, :video_thumbnail

  member_action :delete_content, method: :put do
    @pic = ActiveStorage::Attachment.find_by(record_type: 'OrgContent', record_id: params[:pic_id].to_i)
    @pic.purge_later
    redirect_backwards_or_to_root
  end

  index do
    column :id
    column :title
    column :description
    column :org_event
    column :main_event
    column :title_ru
    column :description_ru
    column :event_date
    column :is_live
    column 'Type' do |c|
      if c.image.attached?
        "Image"
      elsif c.video.attached?
        "Video"
      end
    end
    column :public
    column :published
    column :feed
    column :title_es
    column :description_es

    actions
  end

  show do
    attributes_table do
      row :id
      row :org_event
      row :main_event
      row :title
      row :title_ru
      row :event_date
      row :description
      row :description_ru
      row :public
      row :published
      row :feed
      row :is_live
      row "Image" do |c|
        if c.image.attached?
          ul do
            li do image_tag(url_for(c.image), size: "200x200") end
            li do link_to "Delete", delete_content_admin_org_content_path(pic_id: c.id), method: :put end
          end
        end
      end
      row "Video" do |c|
        if c.video.attached?
          ul do
            li do video_tag(url_for(c.video), size: "200x200") end
            li do link_to "Delete", delete_content_admin_org_content_path(pic_id: c.id), method: :put end
          end
        end
      end
      row "Thumbnail" do |c|
        if c.video_thumbnail.attached?
          ul do
            li do image_tag(url_for(c.video_thumbnail), size: "200x200") end
            li do link_to "Delete", delete_content_admin_org_content_path(pic_id: c.id), method: :put end
          end
        end
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
    input :org_event
    input :main_event
    input :event_date, start_year: 2000
    input :public
    input :feed
    input :is_live
    unless resource.video.attached?
      f.input :image, as: :file, input_html: { direct_upload: true }
    end
    unless resource.image.attached?
      f.input :video, as: :file, input_html: { direct_upload: true }
      f.input :video_thumbnail, as: :file, input_html: { direct_upload: true }
    end
    f.actions
  end
end
