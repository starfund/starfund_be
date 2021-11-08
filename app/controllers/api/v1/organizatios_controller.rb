module Api
  module V1
    class OrganizationsController < Api::V1::ApiController
      skip_before_action :authenticate_user!

      def index
        @orgs = Organization.all
      end
    end
  end
end
