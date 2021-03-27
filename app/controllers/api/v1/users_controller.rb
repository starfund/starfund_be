module Api
  module V1
    class UsersController < Api::V1::ApiController
      # before_action :auth_user, except: :update_password

      def show; end

      def update
        current_user.update!(user_params)
        render :show
      end

      def update_password
        current_user.update!(password_params)
        @newbie = false
        @should_update_password = false
        render :show
      end

      private

      def auth_user
        authorize current_user
      end

      def password_params
        params.permit(:password)
      end

      def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :birthdate)
      end
    end
  end
end
