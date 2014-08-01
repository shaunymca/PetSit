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
      image = 'http://lvh.me:4000/assets/47401-84.png'
      marker_options = { lat: p.coords.latitude, lng: p.coords.longitude, picture: 'http://lvh.me:4000/assets/47401-84.png', width: 32, length: 32}
      Gmaps.map.addMarkers(marker_options)
      Gmaps.map.map_options.auto_zoom = true
      Gmaps.map.adjustMapToBounds()
      console.log(p.coords.latitude)
      console.log(p.coords.longitude)
      console.log(image)
      return
    error_callback = (p) ->
      console.log(p.message)
      return


