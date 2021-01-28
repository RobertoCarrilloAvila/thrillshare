class OrdersController < ApplicationController

  # POST /orders
  def create
    @response = OrderService.new(order_params).create

    if @response[:success]
      render json: @response, status: :created
    else
      render json: @response, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    @response = OrderService.new(order_params).update(params[:id])

    if @response[:success]
      render json: @response, status: :ok
    else
      render json: @response, status: :unprocessable_entity
    end
  end

  # POST /orders/1/cancel
  def cancel
    @response = OrderService.new(order_params).update(params[:id])

    if @response[:success]
      render json: @response, status: :created
    else
      render json: @response, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit!
    end
end
