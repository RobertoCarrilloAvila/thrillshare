class OrderService < ApplicationService
	
	def create
		return response_error(validation_errors) unless valid?
		errors = []
		ActiveRecord::Base.transaction do
			@order = Order.create(@params)
			unless @order.valid?
				errors += @order.errors.full_messages
				raise ActiveRecord::Rollback
			end
		end

		return response_error(errors) if errors.any?
		response_success(oder: @order)
	end

	def update(order_id)
		return response_error(validation_errors) unless valid?
		order = Order.find(order_id)
		if order.update(@params)
			response_success(order: order)
		else
			response_error(order.errors.full_messages)
		end
	end

	def valid_schema
		{
			"type" => "object",
			"properties" => {
				"school_id" => {
					"type" => "integer"
				},
				"status" => {
					"type" => "string",
					"enum" => ["received", "processing", "shipped", "cancelled"]
				},
				"gifts" => {
					"type" => "array",
					# "minItems" => 1,
					"items" => [
						{
							"type" => "object",
							"properties" => {
								"kind" => {
									"type" => "string",
									# "enum" => [""]
								},
								"size" => {
									"type" => "string"
								}
							}
						}
					]
				}
			},
			"required" => ["school_id"]
		}
	end

end