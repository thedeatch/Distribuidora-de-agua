class TrucksController < ApplicationController

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
      redirect_to @truck
    else
      flash[:error] = "Los datos del camion no se han podido guardar, intente nuevamente"
      render :new
    end
  end


  def edit
    @truck = Truck.find(params[:id])
  end

  def update
    @truck = Truck.update(truck_params)

    if @truck.save
      flash[:success] = "Se han actualizado los datos del camion"
      redirect_to @truck
    else
      flash[:error] = "No se han podido actualizar los datos, intente nuevamente"
      render :edit
    end
  end

  def destroy
    @truck.find(params[:id])

    if @truck.destroy
      flash[:notice] = "Se ha eliminado el camion de la base de datos"
      redirect_to @truck
    else
      flash[:alert] = "Ha habido un error al intentar eliminar al camion, intente nuevamente"
      redirect_to @truck
    end
  end

  private

    def truck_params
      params.required(:truck).permit(:name, :load, :number_plate, :detail)
    end

end
