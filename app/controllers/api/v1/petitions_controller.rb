module Api
  module V1
    class PetitionsController < Api::V1::ApiController
      def dream
        @petition = Petition.create(
                      user: current_user,
                      topic: Petition.topics[:ppv],
                      requester: params[:dream][0][:receptor],
                      receiver: params[:dream][0][:email_receptor],
                      explanation: params[:dream][0][:text]
                    )
      end
    end
  end
end
