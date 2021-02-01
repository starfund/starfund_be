module Api
  module V1
    class FightersController < Api::V1::ApiController
      before_action :auth_user

      def index
        @fighter = Fighter.all
      end
    end
  end
end
