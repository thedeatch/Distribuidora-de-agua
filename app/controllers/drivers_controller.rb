class DriversController < ApplicationController

  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      flash[:success] = "Conductor exitosamente agregado"
      redirect_to drivers_path
    else
      flash[:error] = "Conductor no se guardo correctamente"
      render :new
    end
  end

  def edit
    @driver = Driver.find(params[:id])

  end

  def update
    @driver = Driver.find(params[:id])
    if @driver.update(driver_params)
      flash[:success] = "Se han actualizado los datos del conductor"
      redirect_to drivers_path

    else
      flash[:error] = "Datos del conductor no se actualizaron"
      render :edit
    end
  end

  def destroy
    @driver = Driver.find(params[:id])

    if @driver.destroy
      flash.now[:notice] = "Se ha eliminado el conductor"
      redirect_to drivers_path
    else
      flash.now[:alert] = "Ha habido un error al intentar eliminar el conductor, intente mas tarde"
      redirect_to drivers_path
    end

  end


      #metodo para evitar que se ingresen datos de manera maliciosa
      private

        def driver_params
          params.required(:driver).permit(:first_name, :last_name, :income, :license, :birthday, :rut)
        end

end
