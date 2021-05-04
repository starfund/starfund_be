module Api
  module V1
    class SubscriptionsController < Api::V1::ApiController
      helper_method :user

      skip_before_action :authenticate_user!
      # skip_after_action :verify_policy_scoped

      def index
        @geo = geo
        @subscriptions = user.subscriptions
        @public_content = Fighter.includes(:contents).map(&:public_content).flatten
      end

      def create
        @newbie = !current_user.present?
        create_provision_user unless user.present?
        return render_internal_error(StandardError.new "Already subscribed") if already_subscribed

        @subscription = SubscriptionService.new(user, fighter, geo).process(card, price, fighter.id)
      end

      private

      def create_provision_user
        @user = User.create(email: params[:email], first_name: name_array[0], last_name: name_array.slice(1))
        @user.update(password: 'dummypassword') unless @user.valid_password?(@user.password) 

        sign_in(:user, @user, store: false, bypass: false)
        @should_update_password = true
        @auth_headers = @user.create_new_auth_token
        headers['access-token'] = @auth_headers['access-token']
        headers['client'] = @auth_headers['client']
        headers['expiry']  = @auth_headers['expiry']
        headers['uid'] = @auth_headers['uid']
      end

      def already_subscribed
        user.has_sub(fighter)
      end

      def user
        @user ||= (current_user || User.find_by(email: params[:email]))
      end

      def price
        fighter.price_by_geo(geo)
      end

      def name_array
        params[:name].split(' ')
      end

      def fighter
        Fighter.find(params[:fighter])
      end

      def card
        params[:token][:id]
      end
    end
  end
end
