$(document).on('turbolinks:load', function () {

  $('.date#datetimepicker').datetimepicker().data("DateTimePicker").format('ddd, D MMM YYYY, h:mm A')

});