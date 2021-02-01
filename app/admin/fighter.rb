ActiveAdmin.register Fighter do
  permit_params :email, :first_name, :last_name, :country, :reach, :height, :organization, :birthdate  
end
