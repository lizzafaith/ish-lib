



$(document).ready ->
  if $("#venues_show").length > 0
  
    $('#map_canvas_2').css('height', $('.descr-img img').height())
    $('.q').css('height', $('.descr-img img').height() - 20)

    local_resize()

    Utils.scroll_to('a[name="header_two"]')

    $(window).resize ->
      local_resize()

    local_resize = ->
      $('.q').css('width', $('.width-measure').width() - $('.descr-img img').width() - $('#map_canvas_2').width() - 80)
      $('.main').css('width', $('body').width() - $('.sidebar').width() - 40)

    initialize = ->
      latlng = new google.maps.LatLng(x, y)
      myOptions =
        zoom: 14
        center: latlng
        mapTypeId: google.maps.MapTypeId.ROADMAP

      map = new google.maps.Map(document.getElementById("map_canvas_2"), myOptions)
      marker = new google.maps.Marker(
        position: latlng
        map: map
      )

    initialize()