# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->

  $("#visit_date").datepicker(format: "mm/dd/yyyy").on "changeDate", (ev) ->
    $("#visit_date").datepicker "hide"
    
  $("#visit_time_text").timepicker()
  $("#visit_end_time_text").timepicker()
  
  $("#visit_client_id").select2()
  $("#visit_user_id").select2()
  
  $("#geo").on "click", (event) ->
    if geoPosition.init() # Geolocation Initialisation
      geoPosition.getCurrentPosition success_callback, error_callback,
        enableHighAccuracy: true


  success_callback = (p) ->
      latLon = {lat: p.coords.latitude, lng: p.coords.longitude}
      Gmaps.map.addMarkers(latLon)
      Gmaps.map.map_options.auto_zoom = true
      Gmaps.map.adjustMapToBounds()
      console.log(p.coords.latitude)
      console.log(p.coords.longitude)
      return
    error_callback = (p) ->
      console.log(p.message)
      return
