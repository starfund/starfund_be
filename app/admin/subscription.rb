ActiveAdmin.register Subscription do
  permit_params :id, :status

  index do
    column :id
    column :user
    column :team
    column :fighter
    column :status
    column :last_charge
    column :last_charge_date
    column :created_at

    actions
  end

  show do
    attributes_table do
      row :id
      row :user
      row :team
      row :fighter
      row :status
      row :last_charge
      row :last_charge_date
      row :created_at
    end
  end
end
