# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Client.destroy_all 

clients = Client.create!([ 

	{ first_name: "Raul", last_name: "Hurtado", email: "rhurtado@gmail.com", address: "av walker martinez #2345 la florida", phone: "964275236", rut: "20.771.836-k", created_at: (rand*10).days.ago }, 
	{ first_name: "Ismael", last_name: "Contreras", email: "ismacon@gmail.com", address: "francisco de villagra #6744 la reina", phone: "966569049", rut: "17.554.840-8", created_at: (rand*10).days.ago },
	{ first_name: "Contanza", last_name: "Lopez", email: "conilopez@gmail.com", address: "av los leones 7040 Providencia", phone: "959013095", rut: "21.394.768-0" },
	{ first_name: "Felipe", last_name: "Gallardo", email: "pipegallardo@gmail.com", address: "av los orientales 6700 Peñalolen", phone: "975906675", rut: "14.863.931-0", created_at: (rand*10).days.ago },
	{ first_name: "Mauricio", last_name: "Gonzales", email: "mgonzales@outlook.com", address: "diego rojas 6733 la reina", phone: "991923894", rut: "13.501.382-k", created_at: (rand*10).days.ago },
	{ first_name: "Francisca", last_name: "Orsini", email: "franorsini@gmail.com", address: "escriva de balaguer 13105 las condes", phone: "+56979009326", rut: "14.595.019-8", created_at: (rand*10).days.ago },
	{ first_name: "Constanza", last_name: "Viñes", email: "conivines@gmail.com", address: "pasaje el poncho 7650 peñalolen", phone: "+56994141216", rut: "23.822.874-3", created_at: (rand*10).days.ago },
	{ first_name: "Luis", last_name: "Yañez", email: "luchoyanees@outlook.com", address: "obispo salas 5067 providencia", phone: "989457353", rut: "18.491.451-4", created_at: (rand*10).days.ago },
	{ first_name: "Amanda", last_name: "Rojas", email: "amanrojas@gmail.com", address: "diagonal paraguay 8960 santiago centro", phone: "+56957763289", rut: "16.989.382-9", created_at: (rand*10).days.ago },

]) 

Driver.destroy_all 

Driver.create!([

	{ first_name: "Casimiro", last_name: "Soto", birthday: "1999-09-10", income: "285000", rut: "13.501.382-k" }, 
	{ first_name: "Patricio", last_name: "Sepulveda", birthday: "1975-06-06", income: "300000", rut: "12.586.527-5" }, 
	{ first_name: "Ricardo", last_name: "Alarcon", birthday: "1993-07-13", income: "320000", rut: "16.989.382-9" }, 
	{ first_name: "Ignacio", last_name: "Fuenzalida", birthday: "1985-03-23", income: "295000", rut: "14.334.876-8" }, 
	{ first_name: "Leandro", last_name: "Martinez", birthday: "1989-11-24", income: "310000", rut: "17.159.540-1" }

]) 

Truck.destroy_all 

trucks = Truck.create!([ 

	{ name: "peugeot partner", load: "300", number_plate: "BBBB10" }, 
	{ name: "citroen berlingo", load: "500", number_plate: "DTRC78" }, 
	{ name: "fiat fiorino", load: "400", number_plate: "GXTF53" }, 
	{ name: "kia frontier", load: "500", number_plate: "DDFF69"}, 
	{ name: "hyundai minibus h1", load: "600", number_plate: "GKSB78" }

]) 

Product.destroy_all 

products = Product.create!([

	{ detail: "botella 1.5 lts", price: "790", product_number: "323", stock: "1000" }, 
	{ detail: "botella 2.0 lts", price: "1290", product_number: "434", stock: "1000" }, 
	{ detail: "botella 2.5 lts", price: "1790", product_number: "545", stock: "1000" }, 
	{ detail: "botella 3.0 lts", price: "2190", product_number: "656", stock: "800" }, 
	{ detail: "dispensador 20 lts", price: "25990", product_number: "787", stock: "200" }


])  

User.destroy_all 

User.create([ 

	{ email: "esteban.lundin@gmail.com", password: "topsecret", password_confirmation: "topsecret", first_name: "esteban", last_name: "lundin"  }, 
	{ email: "maximiliano.diaz@gmail.com", password: "topsecret", password_confirmation: "topsecret", first_name: "maximiliano", last_name: "diaz", role: "employee"  }

])

#Order.destroy_all 

#Order.create!([

	#{ delivery_date: "2018-09-10 16:59:00", amount: "10", client_id: [clients[0].id, clients[2].id], truck_id: [trucks[0].id, trucks[2].id], product_id: [products[0].id, products[2].id], created_at: (rand*10).days.ago, state: "Finalizado" }#, 
	#{ delivery_date: "2018-09-10 16:00:00", amount: "20", client_id: "33", truck_id: "14", product_id: "6", created_at: (rand*10).days.ago, state: "Finalizado" }, 
	#{ delivery_date: "2018-09-12 18:00:00", amount: "40", client_id: "35", truck_id: "13", product_id: "8", created_at: (rand*10).days.ago, state: "Finalizado" },		
	#{ delivery_date: "2018-09-15 13:00:00", amount: "5", client_id: "40", truck_id: "14", product_id: "10", created_at: (rand*10).days.ago },	
	#{ delivery_date: "2018-09-16 17:30:00", amount: "15", client_id: "38", truck_id: "15", product_id: "7", created_at: (rand*10).days.ago },	
	#{ delivery_date: "2018-09-23 14:15:00", amount: "2", client_id: "37", truck_id: "17", product_id: "10", created_at: (rand*10).days.ago }

#])