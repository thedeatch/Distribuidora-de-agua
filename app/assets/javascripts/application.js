// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery 
//= require jquery_ujs 
//= require jquery-ui/widgets/autocomplete 
//= require select2  
//= require autocomplete-rails 
//= require bootstrap
//= require bootstrap-sprockets
//= require turbolinks 
//= require moment
//= require bootstrap-datetimepicker
//= require bootstrap-datepicker 
//= require Chart.bundle 
//= require chartkick
//= require_tree .

// esto es para que los dropdowns del navbar funcionen correctamente

src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/locale/es.js";

$('.dropdown-toggle').dropdown();

$(document).ready(function() { 
  $('.date#datetimepicker').datetimepicker({ 
    locale: 'es',
  }); 
});

$(document).ready(function() {
  $( "select#simple-example").select2({ theme: "bootstrap" });
});

jQuery(document).ready(function($) {
  $('.dropdown-toggle').dropdown();
}); 


jQuery(document).ready(function($) {
  $("#rut").rut().on('rutValido', function(e, rut, dv) {
      alert("El rut " + rut + "-" + dv + " es correcto");
  }, { minimumLength: 7} );
})

function myFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}