module Api
  module V1
    class PetitionsController < Api::V1::ApiController
      def dream
        @petition = Petition.create(
                      user: current_user,
                      topic: Petition.topics[:ppv],
                      requester: params[:requestor],
                      receiver: params[:emailReceptor],
                      explanation: params[:text]
                    )
      end
    end
  end
end
