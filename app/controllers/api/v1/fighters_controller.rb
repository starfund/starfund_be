module Api
  module V1
    class FightersController < Api::V1::ApiController
      skip_before_action :authenticate_user!
      skip_after_action :verify_policy_scoped

      def index
        @fighters = Fighter.with_attached_images
      end
    end
  end
end
