class DriversTrucksController < ApplicationController

  before_action :authenticate_user! 
  load_and_authorize_resource


  def index 
    @drivers_trucks = DriversTruck.all
  end

  def new 
   
    @drivers_truck = DriversTruck.new

  end


  def create 
    
    @drivers_truck = DriversTruck.new(drivers_truck_params)


    if @drivers_truck.save 
      flash[:success] = "Asignacion al camion exitosamente creada" 
      redirect_to drivers_trucks_path 
    else 
      flash[:error] = "Asignacion erronea, intente mas tarde" 
      render :new 
    end

  end

  def edit 
    @drivers_truck = DriversTruck.find(params[:id])
  end

  def update   
    
    @drivers_truck = DriversTruck.find(params[:id])


    if @drivers_truck.update(driver_truck_params) 
      flash[:success] = "Se ha modificado la asignación" 
      redirect_to drivers_trucks_path 
    else 
      flash[:error] = "Asignación errónea, intente más tarde" 
      render :edit 
    end
  end

  def destroy 
    
    @drivers_truck = DriversTruck.find(params[:id])
    
    if @drivers_truck.destroy 
      flash[:success] = "Se ha eliminado la asignación" 
      redirect_to drivers_trucks_path 
    else 
      flash[:error] = "Ha habido un error al intentar eliminar la asignacion, intente mas tarde" 
      redirect_to drivers_trucks_path 
    end

  end

  private 

    def drivers_truck_params 
      params.require(:drivers_truck).permit(:driver_id, :truck_id, :day)
    end

end
