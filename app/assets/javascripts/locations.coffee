# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
  directionsDisplay = new (google.maps.DirectionsRenderer)
  directionsService = new (google.maps.DirectionsService)

  calcRoute = ->
    origin = new (google.maps.LatLng)(6.2518400, -75.5635900)
    destination = new (google.maps.LatLng)(6.374028999999999, -75.4402878)
    request =
      origin: origin
      destination: destination
      waypoints: [
        {
          location: new (google.maps.LatLng)(6.2519, -75.564)
          stopover: false
        # },{
        #   location: new (google.maps.LatLng)(43.7, -79.4)
        #   stopover: false
        }]
      travelMode: google.maps.TravelMode.DRIVING
    directionsService.route request, (response, status) ->
      if status == google.maps.DirectionsStatus.OK
        directionsDisplay.setDirections response
      return
    return

  calcRoute()
  handler = Gmaps.build('Google')
  handler.buildMap { internal: id: 'directions' }, ->
    directionsDisplay.setMap handler.getMap()
    return
