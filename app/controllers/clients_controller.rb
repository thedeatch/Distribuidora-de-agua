class ClientsController < ApplicationController

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
        flash[:success] = "Cliente exitosamente agregado"
        redirect_to @client
      else
        flash[:error] = "Cliente no se guardo correctamente"
        render :new
      end
    end

    def edit
      @client = Client.find(params[:id])

    end

    def update
      @client = Client.update(client_params)
      if @client.save
        flash[:success] = "Se han actualizado los datos del cliente"
        redirect_to @client

      else
        flash[:error] = "Datos del cliente no se actualizaron"
        render :edit
      end
    end

    def destroy
      @client = Client.find(params[:id]).destroy

    end


    #metodo para evitar que se ingresen datos de manera maliciosa
    private

      def client_params
        params.required(:client).permit(:first_name, :last_name, :email, :address, :phone, :rut)
      end

end
