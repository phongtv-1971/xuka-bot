module RescueExceptions
  extend ActiveSupport::Concern

  included do # rubocop:disable Metrics/BlockLength
    rescue_from ActionController::ParameterMissing, JSON::ParserError, ArgumentError do |errors|
      log_invalid_params_response errors
    end

    rescue_from(
      ActiveRecord::RecordInvalid,
      ActiveRecord::RecordNotDestroyed,
      with: :log_unprocessable_entity_response
    )
    rescue_from ActiveRecord::RecordNotUnique, with: :log_existing_resource_response
    rescue_from ActiveRecord::RecordNotFound, with: :log_resource_not_found_response

    protected

    def log_invalid_params_response error, _status: :bad_request
      msg = "Invalid params, with errors #{error}"

      Api::HookLog.write :error, msg
    end

    def log_unprocessable_entity_response _exception, _status: :bad_request
      full_messages = record.errors.to_hash true

      msg = ""
      record.errors.details.map do |field, details|
        msg += "#{full_messages[field]}, value=#{details.first[:value]} \n"
      end

      Api::HookLog.write :error, msg
    end

    def log_existing_resource_response _exception, _status: :bad_request
      msg = "Resource has been already exists"

      Api::HookLog.write :error, msg
    end

    def log_resource_not_found_response exception, _status: :not_found
      Api::HookLog.write :error, exception.message
    end
  end
end
