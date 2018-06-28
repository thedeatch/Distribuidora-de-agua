class ClientsController < ApplicationController

    before_action :authenticate_user!

    def index
      @clients = Client.all
    end
    

    def show
      @client = Client.find(params[:id])
    end

    def new
      @client = Client.new
    end

    def create
      @client = Client.new(client_params)
      if @client.save
        flash[:success] = "Datos del cliente exitosamente agregados"
        redirect_to clients_path
      else
        flash[:error] = "Los datos del cliente no se han podido guardar, intente nuevamente"
        render :new
      end
    end

    def edit
      @client = Client.find(params[:id])

    end

    def update

      @client = Client.find(params[:id])
      if @client.update(client_params)
        flash[:success] = "Se han actualizado los datos del cliente"
        redirect_to clients_path
      else
        flash[:error] = "No se han podido actualizar los datos, intente mas tarde"
        render :edit
      end
    end

    def destroy
      @client = Client.find(params[:id])

      if @client.destroy
        flash.now[:notice] = "Se ha eliminado el cliente"
        redirect_to clients_path
      else
        flash.now[:alert] = "Ha habido un error al intentar eliminar el cliente, intente nuevamente"
        redirect_to clients_path
      end

    end


    #metodo para evitar que se ingresen datos de manera maliciosa
    private

      def client_params
        params.require(:client).permit(:first_name, :last_name, :email, :address, :phone, :rut)
      end

end
