class OrdersController < ApplicationController

  before_action :authenticate_user!


  def index
    @orders = Order.all
  end

  def new 
  
    @order =  Order.new
  end

  def create 

    @order =  Order.new(order_params)
    
    if @order.save
      flash[:success] = "Pedido exitosamente guardado"
      redirect_to orders_path
    else
      flash[:error] = "El pedido no se guardo correctamente"
      render :new
    end
  end 

  def edit  

    @order = Order.find(params[:id])

  end

  def update 


    @order = Order.find(params[:id])

    if @order.update(order_params)
      flash[:success] = "Pedido exitosamente modificado"
      redirect_to orders_path
    else
      flash[:error] = "El pedido no se modifico correctamente"
      render :edit
    end
  end 

  def destroy 

    @order = Order.find(params[:id]) 

    if @order.destroy 
      flash[:success] = "Se ha eliminado el pedido" 
      redirect_to orders_path 
    else 
      flash[:error] = "Ha habido un error al eliminar el pedido, intente mas tarde" 
      redirect_to orders_path 
    end
  end




  private
    
    def order_params
      params.require(:order).permit(:order_date, :delivery_date, :amount, :client_id, :truck_id, :product_id)
    end

end
