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
        create_provision_user unless user.present?
        SubscriptionService.new(user, fighter).process(card, price, fighter.id)
      end

      private

      def create_provision_user
        @user = User.find_or_create_by(email: params[:email])
        @user.update(password: 'dummypassword') unless @user.password 
        sign_in(@user)
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
