# == Schema Information
#
# Table name: fighter_reports
#
#  id                       :bigint           not null, primary key
#  year                     :integer
#  month                    :integer
#  user_id                  :bigint           not null
#  fighter_id               :bigint           not null
#  page_visits              :integer
#  subscriptors             :integer
#  subscribers_per_visitors :integer
#  monthly_income           :integer
#  cancelations             :integer
#
# Indexes
#
#  index_fighter_reports_on_fighter_id  (fighter_id)
#  index_fighter_reports_on_user_id     (user_id)
#
class FighterReport < ApplicationRecord
  belongs_to :user
  belongs_to :fighter
end
