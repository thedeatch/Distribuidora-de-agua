class TrucksController < ApplicationController

  before_action :authenticate_user!


  def index
    @trucks = Truck.all
  end

  def show
    @trucks = Truck.find(params[:id])
  end

  def new
    @truck = Truck.new
  end

  def create
    @truck = Truck.new(truck_params)

    if @truck.save
      flash[:success] = "Datos del camión exitosamente agregados"
      redirect_to trucks_path
    else
      flash[:error] = "Los datos del camion no se han podido guardar, intente nuevamente"
      render :new
    end
  end


  def edit
    @truck = Truck.find(params[:id])
  end

  def update
    @truck = Truck.find(params[:id])
    if @truck.update(truck_params)
      flash[:success] = "Se han actualizado los datos del camion"
      redirect_to trucks_path
    else
      flash[:error] = "No se han podido actualizar los datos, intente mas tarde"
      render :edit
    end
  end

  def destroy
    @truck.find(params[:id])

    if @truck.destroy
      flash[:notice] = "Se ha eliminado el camion"
      redirect_to trucks_path
    else
      flash[:alert] = "Ha habido un error al intentar eliminar al camion, intente nuevamente"
      redirect_to trucks_path
    end
  end

  private

    def truck_params
      params.require(:truck).permit(:name, :load, :number_plate, :detail)
    end

end
