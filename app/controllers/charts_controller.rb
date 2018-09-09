class ChartsController < ApplicationController  
	
	def new_clients 
		render json: Client.group_by_day(:created_at).count 
	end 

	def new_orders 
		render json: Order.group_by_day(:created_at).count
	end  


end
