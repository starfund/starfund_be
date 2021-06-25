module Api
  module V1
    class BusinessesController < Api::V1::ApiController
      skip_before_action :authenticate_user!

      def index
        @businesses = Business.all
      end
    end
  end
end
