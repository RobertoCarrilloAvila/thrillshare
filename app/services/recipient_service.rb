class RecipientService < ApplicationService
	
	def show(school_id)
		recipients = Recipient.joins(:order).where(orders: {school_id: school_id})
		response_success(recipients: recipients)
	end

	def create
		return response_error(validation_errors) unless valid?
		errors = []
		ActiveRecord::Base.transaction do
			address = Address.create(@params.delete(:address))
			unless address.valid?
				errors += address.errors.full_messages
				raise ActiveRecord::Rollback
			end

			@params[:address] = address
			@recipient = Recipient.create(@params)
			unless @recipient.valid?
				errors += @recipient.errors.full_messages
				raise ActiveRecord::Rollback
			end
		end

		return response_error(errors) if errors.any?
		response_success(recipient: @recipient.as_json(include: :address))
	end

	def update(recipient_id)
		return response_error(validation_errors) unless valid?
		errors = []
		ActiveRecord::Base.transaction do
			@recipient = Recipient.find(recipient_id)
			address = @recipient.address
			unless address.update(@params.delete(:address) || {})
				errors += address.errors.full_messages
				raise ActiveRecord::Rollback
			end

			unless @recipient.update(@params)
				errors += @recipient.errors.full_messages
				raise ActiveRecord::Rollback
			end

			return response_error(errors) if errors.any?
			response_success(recipient: @recipient.as_json(include: :address))
		end
	end

	def delete(recipient_id)
		recipient = Recipient.find(recipient_id)
		recipient.destroy
		response_success
	end

	def valid_schema
		{
			"anyOf" => [
				create_schema,
				update_schema
			]
		}
	end

	private

	def create_schema
		{
			"type" => "object",
			"properties" => {
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
				},
				"order_id" => {
					"type" => "integer"
				},
				"name" => {
					"type" => "string"
				},
				"last_name" => {
					"type" => "string"
				},
				"email" => {
					"type" => "string",
					"format" => "email"
				}
			},
			"required" => ["address", "name", "last_name", "email", "order_id"],
			"additionalProperties" => false
		}
	end

	def update_schema
		{
			"type" => "object",
			"properties" => {
				"address" => {
					"type" => "object",
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
				},
				"order_id" => {
					"type" => "integer"
				},
				"name" => {
					"type" => "string"
				},
				"last_name" => {
					"type" => "string"
				},
				"email" => {
					"type" => "string",
					"format" => "email"
				}
			},
			"additionalProperties" => false
		}
	end

end