module Api
  module V1
    class ApiController < ActionController::API

      helper_method :geo, :cache_url
      # include Pundit
      include ActionController::Caching
      include DeviseTokenAuth::Concerns::SetUserByToken

      # after_action :verify_authorized, except: :index
      # after_action :verify_policy_scoped, only: :index

      before_action :authenticate_user!, except: :status
      # skip_after_action :verify_authorized, only: :status

      rescue_from ActiveRecord::RecordNotFound,        with: :render_not_found
      rescue_from ActiveRecord::RecordInvalid,         with: :render_record_invalid
      rescue_from ActionController::ParameterMissing,  with: :render_parameter_missing

      def status
        render json: { online: true }
      end

      def geo
        # request.location.country_code.downcase
        country_code = request.headers["Cf-Ipcountry"]
        country_code.blank? ? "us" : country_code.downcase
      end

      def cache_url(resource)
        if(ENV['CLOUDFRONT_URL'])
          s3_url = "https://#{ENV['S3_BUCKET_NAME']}.s3.#{ENV['AWS_BUCKET_REGION']}.amazonaws.com"
          resource.service_url.gsub(s3_url, ENV['CLOUDFRONT_URL'])
        else
          polymorphic_url(resource, only_path: true)
        end
      end

      private

      def render_internal_error(exception)
        logger.info { exception }
        render json: { error: exception.message }, status: :internal_server_error
      end

      def render_not_found(exception)
        logger.info { exception }
        render json: { error: I18n.t('api.errors.not_found') }, status: :not_found
      end

      def render_record_invalid(exception)
        logger.info { exception }
        render json: { errors: exception.record.errors.as_json }, status: :bad_request
      end

      def render_parameter_missing(exception)
        logger.info { exception }
        render json: { error: I18n.t('api.errors.missing_param') }, status: :unprocessable_entity
      end
    end
  end
end
