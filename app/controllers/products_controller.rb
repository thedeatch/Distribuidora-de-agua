class ProductsController < ApplicationController

  before_action :authenticate_user! 
  load_and_authorize_resource


  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Producto almacenado correctamente"
      redirect_to products_path
    else
      flash[:error] = "Producto no se ha almacenado correctamente"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "Se han actualizado los datos del producto"
      redirect_to products_path
    else
      flash[:error] = "No se han podido actualizar los datos del producto"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      flash.now[:notice] = "Se ha eliminado el producto"
      redirect_to products_path
    else
      flash.now[:alert] = "Ha habido un error al intentar eliminar el producto, intente mas tarde"
      redirect_to products_path
    end
  end

  private

    def product_params
      params.require(:product).permit(:detail, :price, :product_number, :stock)
    end

end
