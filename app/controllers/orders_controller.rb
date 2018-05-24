class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order =  Order.new
  end

  def create
    @order =  Order.new(order_params)
    if @order.save
      flash[:success] = "Orden exitosamente creada"
      redirect_to @order
    else
      flash[:error] = "La orden no se creo correctamente"
      render :new
    end
  end





  private
  def order_params
    params.require(:order).permit(:order_date, :delivery_date, :amount)
  end

end
