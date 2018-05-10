class OrdersController < ApplicationController

  def index
  @order = Order.all
  end

  def new
    @order =  Order.new
  end

  def create
    @order =  Order.new(order_params)
    if @order.save
      redirect_to orders_path
    else
      "error al crear la orden"
    end
  end





  private
  def order_params
    params.require(:order).permit(:order_date, :delivery_date, :amount)
  end

end
