jQuery ->
  visit_type_ids = undefined
  visit_type_name = undefined
  visit_type_ids = $("#visit_block_client_prices_id").html()
  visit_type_name = $("#visit_block_visit_type").html()
  
  $("#visit_block_client_name").select2(
    placeholder: "Choose an option.",
    allowClear: true
    )

  $("#visit_block_client_name").ready ->
    client_name = undefined
    options = undefined
    client_name = visit_block_client_name.value
    options = $(visit_type_ids).filter("optgroup[label=" + client_name + "]").html()
    console.log client_name
    console.log options
    if options
      $("#visit_block_client_prices_id").html options
      $("#visit_block_client_prices_id").trigger "change"
    else
      $("#visit_block_client_prices_id").empty()

  $("#ui-id-1").ready ->
    client_name = undefined
    options = undefined
    client_name = visit_block_client_name.value
    options = $(visit_type_ids).filter("optgroup[label=" + client_name + "]").html()
    if options
      $("#visit_block_client_prices_id").html options
      $("#visit_block_client_prices_id").trigger "change"
    else
      $("#visit_block_client_prices_id").empty()

  $("#visit_block_client_prices_id").ready ->
    data = undefined
    selectedVisitid = undefined
    visit = undefined
    visit_hash = undefined
    vsts = undefined
    selectedVisitid = visit_block_client_prices_id.value
    data = $("#client_prices_data").data("visit-source")
    vsts = $.grep(data, (n, i) ->
      n.id.toString() is selectedVisitid
    )
    console.log vsts
    if vsts.length > 0
      visit = vsts[0]
      $("#visit_block_visit_type").val visit.visit_type
      $("#visit_block_visit_price").val visit.price
      $("#visit_block_client_id").val visit.client_id
      
  $("#visit_block_client_name").change ->
    client_name = undefined
    options = undefined
    client_name = visit_block_client_name.value
    options = $(visit_type_ids).filter("optgroup[label=" + client_name + "]").html()
    console.log client_name
    if options
      $("#visit_block_client_prices_id").html options
      $("#visit_block_client_prices_id").trigger "change"
    else
      $("#visit_block_client_prices_id").empty()

  $("#ui-id-1").change ->
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
    vsts = $.grep(data, (n, i) ->
      n.id.toString() is selectedVisitid
    )
    console.log vsts
    if vsts.length > 0
      visit = vsts[0]
      $("#visit_block_visit_type").val visit.visit_type
      $("#visit_block_visit_price").val visit.price
      $("#visit_block_client_id").val visit.client_id

  $("#start_date").datepicker(format: "mm/dd/yyyy").on "changeDate", (ev) ->
    $("#start_date").datepicker "hide"
    
  $("#time_zone").set_timezone format: "city"
    
  $("#end_date").datepicker(format: "mm/dd/yyyy").on "changeDate", (ev) ->
    $("#end_date").datepicker "hide"
    
  $("#visit_block_time_text").timepicker()
  
  $("#monday_toggle").on "click", (event) ->
    class_name = monday_toggle.className
    if class_name isnt 'btn btn-primary active'
      $('#visit_block_monday').prop('checked', true)
    else
      $('#visit_block_monday').prop('checked', false)
      
  $("#tuesday_toggle").on "click", (event) ->
    class_name = tuesday_toggle.className
    if class_name isnt 'btn btn-primary active'
      $('#visit_block_tuesday').prop('checked', true)
    else
      $('#visit_block_tuesday').prop('checked', false)
      
  $("#wednesday_toggle").on "click", (event) ->
    class_name = wednesday_toggle.className
    if class_name isnt 'btn btn-primary active'
      $('#visit_block_wednesday').prop('checked', true)
    else
      $('#visit_block_wednesday').prop('checked', false)
      
  $("#thursday_toggle").on "click", (event) ->
    class_name = thursday_toggle.className
    if class_name isnt 'btn btn-primary active'
      $('#visit_block_thursday').prop('checked', true)
    else
      $('#visit_block_thursday').prop('checked', false)
      
  $("#friday_toggle").on "click", (event) ->
    class_name = friday_toggle.className
    if class_name isnt 'btn btn-primary active'
      $('#visit_block_friday').prop('checked', true)
    else
      $('#visit_block_friday').prop('checked', false)
      
  $("#saturday_toggle").on "click", (event) ->
    class_name = saturday_toggle.className
    if class_name isnt 'btn btn-primary active'
      $('#visit_block_saturday').prop('checked', true)
    else
      $('#visit_block_saturday').prop('checked', false)
      
  $("#sunday_toggle").on "click", (event) ->
    class_name = sunday_toggle.className
    if class_name isnt 'btn btn-primary active'
      $('#visit_block_sunday').prop('checked', true)
    else
      $('#visit_block_sunday').prop('checked', false)
