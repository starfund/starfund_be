module Api
  module V1
    class CommentsController < Api::V1::ApiController
      # include Concerns::ActAsApiRequest
      # protect_from_forgery with: :null_session

      helper_method :content

      def index
        @comments = Comment.where(content_id: params[:content_id])
      end

      def create
        @content = CommentService.create_message(content, params[:message], current_user)
      end

      def delete
        @content = Content.destroy(params[:content_id])
      end

      private

      def content
        @content ||= Content.find(params[:content_id])
      end
    end
  end
end
