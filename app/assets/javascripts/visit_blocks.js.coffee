# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#visit_block_client_name').autocomplete
    source: $('#visit_block_client_name').data('autocomplete-source')
    
  visit_types = $("#visit_block_visit_type").html()
  console.log visit_types
  $("#visit_block_client_name").keyup ->
    client_name = visit_block_client_name.value
    options = $(visit_types).filter("optgroup[label=" + client_name + "]").html()
    console.log options
    if options
      $("#visit_block_visit_type").html options
    else
      $("#visit_block_visit_type").empty()
  
  $("#ui-id-1").click ->
    client_name = visit_block_client_name.value
    options = $(visit_types).filter("optgroup[label=" + client_name + "]").html()
    console.log options
    if options
      $("#visit_block_visit_type").html options
    else
      $("#visit_block_visit_type").empty()
