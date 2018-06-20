document.addEventListener('turbolinks:load', function() { 

	$input = $("[data-behavior='autocomplete']") 

	var options = { 
		getValue: "name",  
		url: function(phrase){ 
			return "/search.json?q=" + phrase;
		}, 
		categories: [ 
			{ 
				listLocation: "clients", 
				header: "<strong>Clientes</strong>", 
			}, 
			{ 
				listLocation: "drivers", 
				header: "<strong>Conductores</strong>", 

			},  
			{ 
				listLocation: "trucks", 
				header: "<strong>Camiones</strong>", 

			}, 
			{
				listLocation: "products", 
				header: "<strong>Productos</strong>",

			}
		], 
		list: {  
			onChooseEvent: function() { 
				var url = $input.getSelectedItemData().url 
				$input.val("")
				Turbolinks.visit(url)
			}
		}
	}
	
	$input.easyAutocomplete(options)

});