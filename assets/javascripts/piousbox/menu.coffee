
$(document).ready ->

  menu_secondary_cancollapse = true
  
  if $(".menu-secondary-toggle").length > 0
  
    $(".menu-secondary-toggle").click ->
      menu_secondary_cancollapse = menu_secondary_cancollapse ? false : true

    $(".menu-secondary-toggle").hoverIntent
      sensitivity: 1
      interval: 50
      over: ->
        $(".menu-secondary-content").slideDown()

      timeout: 1300
      out: ->
        $(".menu-secondary-content").slideUp()  if menu_secondary_cancollapse

    $(".menu-secondary-content").hoverIntent
      sensitivity: 5
      interval: 500
      over: ->
        menu_secondary_cancollapse = false

      timeout: 1300
      out: ->
        menu_secondary_cancollapse = true
        $(".menu-secondary-content").slideUp()