module Api
  module V1
    class SubscriptionsController < Api::V1::ApiController
      helper_method :user

      skip_before_action :authenticate_user!
      # skip_after_action :verify_policy_scoped

      def index
        @subscriptions = user.subscriptions
      end

      def create
        @newbie = !user.present?
        create_provision_user unless user.present?
        @subscription = SubscriptionService.new(user, fighter).process(card, price, fighter.id)
      end

      private

      def create_provision_user
        @user = User.find_or_create_by(email: params[:email])
        @user.update(password: 'dummypassword') unless @user.password 

        sign_in(:user, @user, store: false, bypass: false)
        @should_update_password = true
        @auth_headers = @user.create_new_auth_token
        headers['access-token'] = @auth_headers['access-token']
        headers['client'] = @auth_headers['client']
        headers['expiry']  = @auth_headers['expiry']
        headers['uid'] = @auth_headers['uid']
      end

      def user
        @user ||= current_user
      end

      def price
        params[:amount].to_i * 100
      end

      def fighter
        Fighter.find_by(params[:fighter_id])
      end

      def card
        params[:token][:id]
      end
    end
  end
end
