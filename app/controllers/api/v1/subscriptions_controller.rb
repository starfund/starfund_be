module Api
  module V1
    class SubscriptionsController < Api::V1::ApiController
      helper_method :user

      skip_before_action :authenticate_user!

      def index
        @geo = geo
        @subscriptions = user&.active_subscriptions || []
        @public_content = Fighter.with_basic_attachments.with_content.map(&:public_content).flatten
        @business_subs = user&.active_business_subscriptions || []
        @org_subs = user&.active_org_subscriptions || []
        @ppv_charges = user&.active_ppv_charges || []
      end

      def create
        @newbie = !current_user.present?
        create_provision_user unless user.present?
        return render_internal_error(StandardError.new "Already subscribed") if already_subscribed

        @subscription = SubscriptionService.new(user, fighter, team, business, organization, geo).process(card, price, card_data)
      end

      def ppv
        @newbie = !current_user.present?
        create_provision_user unless user.present?
        return render_internal_error(StandardError.new "Already purchased") if already_purchased

        @charge = ChargeService.new(user, org_event, geo).ppv(card, price, card_data)
      end

      def old_ppv
        @newbie = !current_user.present?
        create_provision_user unless user.present?

        @charge = ChargeService.new(user, fighter, geo).process(card, ppv_price, card_data)
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
        return user.has_sub(fighter) if params[:fighter]
        return user.has_team_sub(team) if params[:team]
        return user.has_gym_sub(business) if params[:business]
        return user.has_org(organization) if params[:organization]
      end

      def already_purchased
        return Charge.where(user_id: user.id, org_event: org_event.id).any?
      end

      def user
        @user ||= (current_user || User.find_by(email: params[:email]))
      end

      def price
        return fighter.price_by_geo(geo) if params[:fighter]
        return team.price_by_geo(geo) if params[:team]
        return business.price_by_geo(geo) if params[:business]
        return params[:price] if params[:organization] || params[:org_event]
      end

      def name_array
        params[:name].split(' ')
      end

      def fighter
        Fighter.find_by(id: params[:fighter])
      end

      def team
        Team.find_by(id: params[:team])
      end

      def business
        Business.find_by(id: [params[:business]])
      end

      def organization
        org_name = params[:organization].downcase.capitalize
        Organization.find_by(name: org_name)
      end

      def org_event
        OrgEvent.find(params[:org_event])
      end

      def card
        params[:token][:id]
      end

      def card_data
        params[:token][:card]
      end

      def ppv_price
        500
      end
    end
  end
end
