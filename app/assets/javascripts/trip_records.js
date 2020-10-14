$(document).on('turbolinks:load', function(){

  var truck_capacity;
  truck_capacity = parseInt($('#trip_record_site_truck_capacity').val());
  if($('.truck_capacity').val() == ""){
    $('.truck_capacity').val(parseInt(truck_capacity));
  }
  
});

$(document).ready(function() {

  var truck_capacity;
  truck_capacity = parseInt($('#trip_record_site_truck_capacity').val());
  if($('.truck_capacity').val() == ""){
    $('.truck_capacity').val(parseInt(truck_capacity));
  }

});
