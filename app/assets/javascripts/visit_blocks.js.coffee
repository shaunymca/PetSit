jQuery ->
  visit_type_ids = undefined
  visit_type_name = undefined
  $("#visit_block_client_name").autocomplete source: $("#visit_block_client_name").data("autocomplete-source")
  visit_type_ids = $("#visit_block_client_prices_id").html()
  visit_type_name = $("#visit_block_visit_type").html()
  $("#visit_block_client_name").keyup ->
    client_name = undefined
    options = undefined
    client_name = visit_block_client_name.value
    options = $(visit_type_ids).filter("optgroup[label=" + client_name + "]").html()
    if options
      $("#visit_block_client_prices_id").html options
      $("#visit_block_client_prices_id").trigger "change"
    else
      $("#visit_block_client_prices_id").empty()

  $("#ui-id-1").click ->
    client_name = undefined
    options = undefined
    client_name = visit_block_client_name.value
    options = $(visit_type_ids).filter("optgroup[label=" + client_name + "]").html()
    if options
      $("#visit_block_client_prices_id").html options
      $("#visit_block_client_prices_id").trigger "change"
    else
      $("#visit_block_client_prices_id").empty()

  $("#visit_block_client_prices_id").change ->
    data = undefined
    selectedVisitid = undefined
    visit = undefined
    visit_hash = undefined
    vsts = undefined
    selectedVisitid = visit_block_client_prices_id.value
    data = $("#client_prices_data").data("visit-source")
    visit_hash = $.parseJSON(data)
    vsts = $.grep(data, (n, i) ->
      n.id.toString() is selectedVisitid
    )
    console.log vsts
    if vsts.length > 0
      visit = vsts[0]
      $("#visit_block_visit_type").val visit.visit_type
      $("#visit_block_visit_price").val visit.price

  $("#start_date").datepicker(format: "mm-dd-yyyy").on "changeDate", (ev) ->
    $("#start_date").datepicker "hide"
    
  $("#end_date").datepicker(format: "mm-dd-yyyy").on "changeDate", (ev) ->
    $("#end_date").datepicker "hide"
    
  $("#visit_block_time_text").timepicker()