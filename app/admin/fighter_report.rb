ActiveAdmin.register FighterReport do
  permit_params :id, :year, :month, :user_id, :fighter_id,
                :page_visits, :subscriptors, :subscribers_per_visitors,
                :monthly_income, :cancelations, :week
end
