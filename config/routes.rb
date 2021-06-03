Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  ExceptionHunter.routes(self)
  mount_devise_token_auth_for 'User', at: '/api/v1/users', controllers: {
    registrations: 'api/v1/registrations',
    sessions: 'api/v1/sessions',
    passwords: 'api/v1/passwords'
  }

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get :status, to: 'api#status'

      devise_scope :user do
        resource :user, only: %i[update show] do
          post :update_password
        end
      end
      resources :settings, only: [] do
        get :must_update, on: :collection
      end
      resources :comments
      resources :credit_cards
      resources :fighters
      resources :subscriptions
      resources :contents do
        member do
          post :like
          post :unlike
        end
      end
    end
  end

  # Webhooks
  post '/stripe_subscription_notifications' => 'webhooks/stripe_subscriptions#update'

  # Engines
  mount ActionCable.server => '/cable'
end
