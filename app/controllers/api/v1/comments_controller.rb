module Api
  module V1
    class CommentsController < Api::V1::ApiController
      skip_before_action :authenticate_user!, only: :index
      helper_method :content

      def index
        @comments = Comment.where(content_id: params[:content_id])
      end

      def create
        @comment = CommentService.create_message(content, params[:message], current_user)
      end

      def delete
        @content = Content.destroy(params[:content_id])
      end

      private

      def content
        @content ||= Content.find(params[:id])
      end
    end
  end
end
