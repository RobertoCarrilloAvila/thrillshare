class SchoolsController < ApplicationController
  before_action :user_authenticated?

  # POST /schools
  def create
    @response = SchoolService.new(school_params).create

    if @response[:success]
      render json: @response, status: :created
    else
      render json: @response, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /schools/1
  def update
    @response = SchoolService.new(school_params).update(params[:id])
    
    if @response[:success]
      render json: @response, status: :ok
    else
      render json: @response, status: :unprocessable_entity
    end
  end

  # DELETE /schools/1
  def destroy
    @response = SchoolService.new.delete(params[:id])

    if @response[:success]
      render json: @response, status: :created
    else
      render json: @response, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def school_params
      params.require(:school).permit!
    end
end
