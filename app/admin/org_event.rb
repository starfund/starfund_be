ActiveAdmin.register OrgEvent do
  permit_params :id, :name, :organization_id, :description, :event_date, :stream_link, :finished
end