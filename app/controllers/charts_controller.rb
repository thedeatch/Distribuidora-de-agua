class ChartsController < ApplicationController  
	
	def new_clients 
		render json: Client.group_by_day(:created_at).count 
	end 

	def new_orders 
		render json: Order.group_by_hour(:created_at).count
	end 

	def order_status 
		render json: Order.group(:state).count
	end  

	def income_per_orders 
		render json: Order.calcular_valor.count 
	end


end
