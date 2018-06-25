json.clients do 
	json.array!(@clients) do |client| 
		json.name client.fullName
		json.url client_path(client)
	end
end 

json.drivers do 
	json.array!(@drivers) do |driver| 
		json.name driver.fullName
		json.url driver_path(driver)
	end
end 

json.trucks do 
	json.array!(@trucks) do |truck| 
		json.name truck.name 
		json.url truck_path(truck)
	end
end 

json.products do 
	json.array!(@products) do |product| 
		json.name product.detail 
		json.url product_path(product)
	end
end