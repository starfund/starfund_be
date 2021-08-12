module Api
  module V1
    class SessionsController < DeviseTokenAuth::SessionsController
      protect_from_forgery with: :null_session
      include Api::Concerns::ActAsApiRequest

      private

      def resource_params
        params.require(:user).permit(:email, :password)
      end

      def render_create_success
        render json: {
          user:resource_data_params.merge(resource_billing_params)
        }
      end

      def resource_data_params
        JSON.parse(resource_data.to_json(
          only: ["id", "first_name", "last_name", "email", "name", "username", "birthdate", "is_fighter"]
        ))
      end

      def resource_billing_params
        JSON.parse(User.find(resource_data['id'])&.default_card.to_json(
          only: ["id", "card_id", "default", "last4"]
        ))
      end
    end
  end
end
