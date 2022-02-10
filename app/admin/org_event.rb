ActiveAdmin.register OrgEvent do
  permit_params :id, :name, :organization_id, :description, :event_date, :stream_link, :finished, :home_page, :cover_photo, :replay

  show do
    attributes_table do
      row :id
      row :name
      row :organization
      row :description
      row :event_date
      row :stream_link
      row :finished
      row :home_page
      row :replay
      row "Cover Photo" do |p|
        if p.cover_photo.attached?
          image_tag(url_for(p.cover_photo), size: "200x200")
        end
      end
    end
  end

  form multipart: true, direct_upload: true do |f|
    input :name
    input :organization
    input :description
    input :event_date
    input :stream_link
    input :finished
    input :home_page
    input :replay
    f.input :cover_photo, as: :file
    f.actions
  end
end
