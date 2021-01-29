class ApplicationController < ActionController::API

	rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
	rescue_from ActionController::ParameterMissing, with: :render_bad_request_response

	def render_not_found_response(exception)
    render json: ApplicationService.new.response_error("Not Found"), status: :not_found
  end

  def render_bad_request_response(exception)
    render json: ApplicationService.new.response_error("Bad Request"), status: :not_found
  end

end
