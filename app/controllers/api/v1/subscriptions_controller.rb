module Api
  module V1
    class SubscriptionsController < Api::V1::ApiController
      helper_method :user

      def index
        @subscriptions = user.subscriptions
      end

      def create
        SubscriptionService.new(user, fighter).process(price, card)
      end

      private

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
        params[:card_id]
      end
    end
  end
end
