class SchoolService < ApplicationService
	
	def create
		return response_error(validation_errors) unless valid?
		errors = []
		ActiveRecord::Base.transaction do
			@address = Address.create(@params[:address])
			unless @address.valid?
				errors += @address.errors.full_messages
				raise ActiveRecord::Rollback
			end

			@school = School.create(name: @params[:name], address_id: @address.id)
			unless @school.valid?
				errors += @school.errors.full_messages
				raise ActiveRecord::Rollback
			end
		end

		return response_error(errors) if errors.any?
		response_success(school: @school.as_json(include: :address))
	end

	def update(school_id)
		return response_error(validation_errors) unless valid?
		school = School.find(school_id)
		if school.update(@params)
			response_success(school: school)
		else
			response_error(school.errors.full_messages)
		end
	end

	def delete(school_id)
		school = School.find(school_id)
		school.destroy
		response_success
	end

	def valid_schema
		{
			"type" => "object",
			"properties" => {
				"name" => {
					"type" => "string"
				},
				"address_id" => {
					"type" => "integer"
				},
				"address" => {
					"type" => "object",
					"required" => ["state", "zip_code", "city", "street"],
					"properties" => {
						"state" => {
							"type" => "string"
						},
						"zip_code" => {
							"type" => "string"
						},
						"city" => {
							"type" => "string"
						},
						"street" => {
							"type" => "string"
						}
					},
					"additionalProperties" => false
				}
			},
			"additionalProperties" => false,
			"anyOf" => [
				{
					"required" => ["name", "address_id"]
				},
				{
					"required" => ["name", "address"]
				},
				{
					"required" => ["name"]
				}
			]
		}
	end

end