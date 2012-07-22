
$(document).ready ->

  HF.footer_expanded = (val) ->
    if val == undefined
      ans = localStorage.footer_expanded
      if ans == "false"
        return false
      if ans == "true"
        return true
    else
      localStorage.setItem('footer_expanded', val)

  HF.header_expanded = (val) ->
    if val == undefined
      return (localStorage.header_expanded == "true") ? true : false
    else
      localStorage.setItem('header_expanded', val)

  HF.collapse_footer = ->
    $(".L").addClass('footer-collapsed')

  HF.expand_footer = ->
    $(".L").removeClass('footer-collapsed')

  HF.toggle_footer = ->
    if HF.footer_expanded() == true
      HF.collapse_footer()
      HF.footer_expanded(false)
    else
      HF.expand_footer()
      HF.footer_expanded(true)

  HF.collapse_header = ->
    $(".L").addClass('header-collapsed')
    
  HF.expand_header = ->
    $(".L").removeClass('header-collapsed')
    
  HF.toggle_header = ->
    if HF.header_expanded() == true
      HF.collapse_header()
      HF.header_expanded(false)
    else
      HF.expand_header()
      HF.header_expanded(true)



  