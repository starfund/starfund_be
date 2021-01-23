module Api
  module V1
    class CreditCardsController < Api::V1::ApiController
      helper_method :user

      def index
        service = StripeService.new(user)
        @card = service.credit_card_info
        @customer = service.customer
      end

      def create
        service = StripeService.new(user)
        service.add_card(token_id, email, customer_name) if token_id
        @card = service.credit_card_info
      end

      def update
        begin
          StripeService.new(user).update_credit_card(token_id)
        rescue StripeService::StripeException => ex
          return render_not_found(ex.message)
        end
        head :no_content
      end

      private

      def user
        @user ||= current_user
      end

      def token_json
        params[:token]
      end

      def token_id
        token_json['id']
      end

      def email
        token_json['email'] || "example#{user.id}@example.com"
      end

      def customer_name
        token_json['name'] || user.full_name
      end
    end
  end
end
