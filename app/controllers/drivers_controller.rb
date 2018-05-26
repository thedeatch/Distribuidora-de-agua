class DriversController < ApplicationController

  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def new
    @drivers = Driver.new
  end

  def _form

  end

  def create
    @driver = Driver.create(driver_params)
    if @driver.save
      flash[:success] = "Conductor exitosamente agregado"
      redirect_to @driver
    else
      flash[:error] = "Conductor no se guardo correctamente"
      render :new
    end
  end

  def edit
    @driver = Driver.find(params[:id])

  end

  def update
    @driver = Driver.update(driver_params)
    if @driver.save
      flash[:success] = "Se han actualizado los datos del conductor"
      redirect_to @driver

    else
      flash[:error] = "Datos del conductor no se actualizaron"
      render :edit
    end
  end

  def destroy
    @driver = Driver.find(params[:id]).destroy

  end


      #metodo para evitar que se ingresen datos de manera maliciosa
      private

        def driver_params
          params.required(:driver).permit(:first_name, :last_name, :income, :license, :birthday, :rut)
        end

end
