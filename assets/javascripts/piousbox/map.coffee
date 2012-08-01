

$(document).ready ->
  el = $("#map_canvas")
  x1 = 0
  x2 = 0
  y1 = 0
  y2 = 0
  counter = 3
  render_num = counter
  delta_counter = 0
  
  if el.length > 0
    flag_move = false
    
    el.on 'mousedown', (e) ->
      flag_move = true
      x1 = e.pageX - el.offset().left
      y1 = e.pageY - el.offset().top
      
    el.on 'mouseup', (e) ->
      flag_move = false
      counter = render_num
    el.on 'mouseout', (e) ->
      flag_move = false
      counter = render_num
      
    el.on 'mousemove', (e) ->
      if flag_move
        x2 = e.pageX - el.offset().left
        y2 = e.pageY - el.offset().top
        delta_x = x2 - x1
        delta_y = y2 - y1
        U.log "( " + delta_x + ", " + delta_y + " )"
        
        # deal with delta_x
        if delta_x < 0
          delta_counter = Math.ceil( delta_x / 25 )
        else if delta_x > 0
          delta_counter = Math.floor( delta_x / 25 )
        render_num = counter + delta_counter
        
        while render_num < 1
          render_num = render_num + 5
        while render_num > 5
          render_num = render_num - 5
          
        $("#map_canvas").css('background', "url('/assets/map/" + render_num + ".jpg')")