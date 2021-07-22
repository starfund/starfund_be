module Api
  module V1
    class FightersController < Api::V1::ApiController
      skip_before_action :authenticate_user!
      # skip_after_action :verify_policy_scoped

      def index
        @with_content = params[:with_content].to_s.downcase == "true"
        @fighters = Fighter.with_content.all
      end
    end
  end
end
