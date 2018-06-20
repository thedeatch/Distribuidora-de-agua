class MainController < ApplicationController 


	def index 

	end  



	def search  

		@clients  = Client.ransack(params[:q]).result(distinct: true)
		@drivers  = Driver.ransack(params[:q]).result(distinct: true)
		@trucks   = Truck.ransack(params[:q]).result(distinct: true)
		@products = Product.ransack(params[:q]).result(distinct: true)

		respond_to do |format| 
			format.html {} 
			format.json { 
				@clients = @clients.limit(5) 
				@drivers = @drivers.limit(5) 
				@trucks = @trucks.limit(5) 
				@products = @products.limit(5) 

			}
		end 


	end 

end
