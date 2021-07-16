module Api
  module V1
    class FighterReportsController < Api::V1::ApiController
      def index
        @report = current_user.last_report
      end
    end
  end
end
