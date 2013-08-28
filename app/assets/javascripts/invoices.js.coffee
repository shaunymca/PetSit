# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->

  $("#invoice_start_date").datepicker(format: "mm/dd/yyyy").on "changeDate", (ev) ->
    $("#invoice_start_date").datepicker "hide"
    
  $("#invoice_end_date").datepicker(format: "mm/dd/yyyy").on "changeDate", (ev) ->
    $("#invoice_end_date").datepicker "hide"
    
  $("#due_date").datepicker(format: "mm/dd/yyyy").on "changeDate", (ev) ->
    $("#due_date").datepicker "hide"
  
  $("#invoice_client_id").select2
    placeholder: "Choose an option.",
    allowClear: true