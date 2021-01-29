class OrderService < ApplicationService
	
	def index(school_id)
		orders = Order.where(school_id: school_id)
		response_success(orders: orders.as_json(include: :gifts))
	end

	def create
		return response_error(validation_errors) unless valid?
		order = Order.create(params_create_format)
		if order.valid?
			response_success(order: order.as_json(include: :gifts))
		else
			response_error(order.errors.full_messages)
		end
	end

	def update(order_id)
		return response_error(validation_errors) unless valid?
		order = Order.find(order_id)
		return response_error("An order with status shipped cannot be updated") if order.shipped?
		if order.update(parse_params)
			response_success(order: order.as_json(include: :gifts))
		else
			response_error(order.errors.full_messages)
		end
	end

	def cancel(order_id)
		order = Order.find(order_id)
		if order.update(status: :cancelled)
			response_success(order: order.as_json(include: :gifts))
		else
			response_error(order.errors.full_messages)
		end
	end

	def params_create_format
		parse_params
		@params[:gifts_attributes].map { |gift| gift.permit(:kind, :size) }
		@params
	end

	def parse_params
		@params[:gifts_attributes] = @params.delete(:gifts) if @params.has_key?(:gifts)
		@params
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
					"minItems" => 1,
					"items" => {
						"type" => "object",
						"properties" => {
							"kind" => {
								"type" => "string",
								"enum" => ["mug", "tshirt", "hoodie", "sticker"]
							},
							"size" => {
								"type" => ["string", nil]
							}
						}
					}
				}
			}
		}
	end

end