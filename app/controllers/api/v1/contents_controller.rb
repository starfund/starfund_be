module Api
  module V1
    class ContentsController < Api::V1::ApiController
      def index
        @public_content = Fighter.includes(:contents).map(&:public_content).flatten
        @private_content = current_user.subscriptions.map(&:fighter).uniq.map(&:private_content).flatten
        @user_likes = UserLike.where(user: current_user)
      end

      def like
        UserLike.find_or_create_by(user: current_user, content_id: params[:id])
        Content.increment_counter(:likes_count, params[:id])
        @content = Content.find(params[:id])
      end

      def unlike
        like = UserLike.find_by(user: current_user, content_id: params[:id])
        like.destroy
        Content.decrement_counter(:likes_count, params[:id])
        @content = Content.find(params[:id])
      end
    end
  end
end
