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
      redirect_to home_about_path, notice: "Order Successfully Placed"

    else
      render :new, notice: "Error"
    end
  end


  private
  def order_params
    params.require(:order).permit(:restaurant, :order, :total, :tip, :profile_id)
  end
end
