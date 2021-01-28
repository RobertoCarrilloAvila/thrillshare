class ApplicationService
	
	def initialize(params = nil)
		@params = params
	end

	def valid?
		JSON::Validator.validate(valid_schema, @params.to_unsafe_hash)
	end

	def validation_errors
		error_list = JSON::Validator.fully_validate(valid_schema, @params.to_hash)
		error_list.map { |error| error.gsub(/(#\/)|( in schema.*)/, '') }
	end

	def response_error(errors)
		{
		  success: false,
		  errors: Array.wrap(errors).flatten
		}
	end

	def response_success(payload = {})
		{
		  success: true,
		  payload: payload
		}
	end

	def valid_schema
		{
			"type" => "object",
			"properties" => {}
		}
	end

end