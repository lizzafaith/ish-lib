

Utils.scroll_to = (str, milisec = 250) ->  
  unless window.location.hash
    $('html,body').animate
         scrollTop: $(str).offset().top
       , milisec, ->
     
Utils.loading = ->
  $('#loading').css('display', 'block')
  
Utils.loaded = ->
  $('#loading').css('display', 'none')
  
Utils.init_scroller = (sel, str2) ->
  offset = $(sel).offset()
  margin_top = parseInt($(sel).css('padding-bottom'))


  if $(window).scrollTop() > (offset.top + margin_top )
    $(sel).addClass(str2)
  else
    $(sel).removeClass(str2)
      
  $(window).scroll ->
    if $(window).scrollTop() > (offset.top + margin_top )
      $(sel).addClass(str2)
    else
      $(sel).removeClass(str2)
      
pretty_date = (input) ->
  date = new Date(input)
  date.toDateString()
  
$(window).unload ->


$(document).ready ->

  # tested
  U.log = (line) ->
    # log this line
    linee = $("<div>").html(line)
    $("#log_main").append(linee)
    
  # measures
  U.logo = 100
  U.collapsed = 20