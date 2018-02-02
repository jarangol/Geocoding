$(document).on "turbolinks:load", ->
  directionsDisplay = new (google.maps.DirectionsRenderer)
  directionsService = new (google.maps.DirectionsService)

  calcRoute = ->
    if gon
      size = gon.locations.length
      alert
      origin = new (google.maps.LatLng)(gon.locations[0].latitude, gon.locations[0].longitude)
      destination = new (google.maps.LatLng)(gon.locations[size-1].latitude, gon.locations[size-1].longitude)
      # waypts = []
      # i = 1
      # while i < size-1
      #   waypts.push
      #     location: new (google.maps.LatLng)(gon.locations[i].latitude,gon.locations[i].longitude)
      #     stopover: false
      #   i++
      request =
        origin: origin
        destination: destination
        # waypoints:waypts
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
