class RecipientsController < ApplicationController

  # GET /recipients/1
  def show
    @response = RecipientService.new.show(params[:id])

    if @response[:success]
      render json: @response, status: :ok
    else
      render json: @response, status: :unprocessable_entity
    end
  end

  # POST /recipients
  def create
    @response = RecipientService.new(recipient_params).create

    if @response[:success]
      render json: @response, status: :created
    else
      render json: @response, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipients/1
  def update
    @response = RecipientService.new(recipient_params).update(params[:id])

    if @response[:success]
      render json: @response, status: :ok
    else
      render json: @response, status: :unprocessable_entity
    end
  end

  # DELETE /recipients/1
  def destroy
    @response = RecipientService.new.delete(params[:id])

    if @response[:success]
      render json: @response, status: :created
    else
      render json: @response, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def recipient_params
      params.require(:recipient).permit!
    end
end
