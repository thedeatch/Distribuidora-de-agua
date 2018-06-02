class ProductsController < ApplicationController

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

    if @product.update(product_params)
      flash[:success] = "Se han actualizado los datos del producto"
      redirect_to products_path
    else
      flash[:error] = "No se han podido actualizar los datos del producto"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id]).destroy
  end

  private

    def product_params
      params.required(:product).permit(:detail, :price, :product_number, :stock, :liters)
    end

end
