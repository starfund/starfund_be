# Put here the variables used by all the environments
variables = []

unless Rails.env.test?
  # Variables not used by the test environment
  variables += %w[SECRET_KEY_BASE]
end

Figaro.require_keys(variables)
