class DriverTrucksController < ApplicationController

  def index 
    @driver_trucks = DriverTruck.all
  end

  def new 
   
    @driver_truck = DriverTruck.new

  end


  def create 
    
    @driver_truck = DriverTruck.new(driver_truck_params)


    if @driver_truck.save 
      flash[:success] = "Asignacion al camion exitosamente creada" 
      redirect_to driver_trucks_path 
    else 
      flash[:error] = "Asignacion erronea, intente mas tarde" 
      render :new 
    end

  end

  def edit 
    @driver_truck = DriverTruck.find(params[:id])
  end

  def update   
    
    @driver_truck = DriverTruck.find(params[:id])


    if @driver_truck.update(driver_truck_params) 
      flash[:success] = "Se ha modificado la asignación" 
      redirect_to driver_trucks_path 
    else 
      flash[:error] = "Asignación errónea, intente más tarde" 
      render :edit 
    end
  end

  def destroy 
    
    @driver_truck = DriverTruck.find(params[:id])
    
    if @driver_truck.destroy 
      flash[:success] = "Se ha eliminado la asignación" 
      redirect_to driver_trucks_path 
    else 
      flash[:error] = "Ha habido un error al intentar eliminar la asignacion, intente mas tarde" 
      redirect_to driver_trucks_path 
    end

  end

  private 

    def driver_truck_params 
      params.require(:driver_truck).permit(:driver_id, :truck_id, :day)
    end

end
