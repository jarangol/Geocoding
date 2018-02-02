$ ->
  $(document).on 'click', '#btn_new_location', (evt) ->
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition ((position) ->
        alert(position.coords.latitude + " " + position.coords.longitude)
        $.ajax '/locations',
          type: 'POST'
          data: {
            location:{
              latitude: position.coords.latitude
              longitude: position.coords.longitude
            }
          }
          error: (jqXHR, textStatus, errorThrown) ->
            console.log("AJAX Error: #{textStatus}")
          success: (data, textStatus, jqXHR) ->
            console.log("Dynamic brand select OK!")
      )
