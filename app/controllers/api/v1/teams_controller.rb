module Api
  module V1
    class TeamsController < Api::V1::ApiController
      skip_before_action :authenticate_user!

      def index
        @with_content = params[:with_content].to_s.downcase == "true"
        if @with_content
          @teams = Team.includes(:fighters)includes(:contents).all
        else
          @teams = Team.all
        end
      end
    end
  end
end
