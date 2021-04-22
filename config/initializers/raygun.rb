Raygun.setup do |config|
  config.api_key = ENV['RAYGUN_API_KEY']
  config.filter_parameters = [ :password, :card_number, :cvv ]
  config.enable_reporting = true # to send errors, false to not log

  # The default is Rails.env.production?
  # config.enable_reporting = !Rails.env.development? && !Rails.env.test?
end
