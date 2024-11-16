class RequestsController < ApplicationController
  def index
    @request = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)

    if @request.save
      redirect_to home_about_path, notice: "Job Successfully Taken"

    else
      render :new, notice: "Error"
    end
  end

  def makeReq
  end

  def update
    attributes = request_params.clone

    @request = Request.find_by(id: 1)
    # @request.delivery_status.update!(delivery_status: [ :profile_id, 0 ])
  end

  private
  def request_params
    params.permit(:delivery_status, :id, :profile_id)
  end
end
