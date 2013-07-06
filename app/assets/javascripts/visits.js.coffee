# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->

  $("#visit_date").datepicker(format: "mm/dd/yyyy").on "changeDate", (ev) ->
    $("#visit_date").datepicker "hide"
    
  $("#visit_time_text").timepicker()
  $("#visit_end_time_text").timepicker()
  
  $("#visit_client_id").select2()