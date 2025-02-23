class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @orders = Order.new
  end

  def create
    @orders = Order.new(order_params)

    if @orders.save
      redirect_to root_path, notice: "Order Successfully Placed"

    else
      render :new, notice: "Error"
    end
  end

  def destroy
    @orders = params[:param_to_del]
    @del = Order.find_by(id: @orders)
    if @del.destroy!
      redirect_to home_order_path, notice: "Order has been cancelled"
    else
      render :new, notice: "Error"
    end
  end

  def renderReq
  end

  def update
    attributes = request_params.clone

    # @request = Order.find_by(id: attributes[:id])
    @request1 = Order.find_by(id: attributes[:id])
    @request = Order.where(id: attributes[:id]).update!(delivery_status: [ attributes[:profile_id], 0 ], pending: false)
    if @request1 != @request
      redirect_to request_path, notice: "Task Successfully Claimed"

    else
      render :new, notice: "Error"
    end
    # p "----------------------------REQUESTSSSS-------------------------------- ", @request
    # p "----------------------------REQUESTSSSS-------------------------------- ", @request2
    # @request.delivery_status.update!(delivery_status: [ :profile_id, 0 ])
  end

  private
  def order_params
    params.require(:order).permit(:restaurant, :order, :total, :tip, :profile_id, :school_id, :address)
  end

  def request_params
    params.permit(:delivery_status,  :profile_id, :id)
  end
end
