module Api
  module V1
    class OrganizationsController < Api::V1::ApiController
      skip_before_action :authenticate_user!

      def index
        @orgs = Organization.with_events_and_merch.all
      end
    end
  end
end
