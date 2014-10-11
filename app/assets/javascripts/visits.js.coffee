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

  console.log $("#visit_checkin_lon").attr "value"
  console.log $("#visit_checkin_lan").attr "value"

  $("#checkin_load").click ->
    console.log "hy"
    image = $("#geo").data("walker-url")
    latitude = $("#visit_checkin_lan").attr "value"
    longitude = $("#visit_checkin_lon").attr "value"
    marker_options = { lat: latitude, lng: longitude, picture: image, width: 32, length: 32, infowindow: "hello!"}
    console.log marker_options
    Gmaps.map.addMarkers(marker_options)
    Gmaps.map.map_options.auto_zoom = true
    Gmaps.map.adjustMapToBounds()

  $("#geo").on "click", (event) ->
    if geoPosition.init() # Geolocation Initialisation
      geoPosition.getCurrentPosition success_callback, error_callback,
        enableHighAccuracy: true

  success_callback = (p) ->
      latLon = {lat: p.coords.latitude, lng: p.coords.longitude}
      image = $("#geo").data("walker-url")
      marker_options = { lat: p.coords.latitude, lng: p.coords.longitude, picture: image, width: 32, length: 32, infowindow: "hello!"}
      console.log marker_options
      Gmaps.map.addMarkers(marker_options)
      Gmaps.map.map_options.auto_zoom = true
      Gmaps.map.adjustMapToBounds()
      console.log(p.coords.latitude)
      console.log(p.coords.longitude)
      $("#visit_checkin_lon").val p.coords.longitude
      $("#visit_checkin_lan").val p.coords.latitude
      $("#submit_button").removeAttr "disabled"
      return
    error_callback = (p) ->
      console.log(p.message)
      return
