
if window.location.hash == '#_=_'
  window.location.hash = ''
  window.location.href=window.location.href.slice(0, -1)
      
$(document).ready ->
  
  
  $("#layout_set").change ->
      $("#set_layout form").submit()
      
  if $(".sidebar-scroller").length > 0
    Utils.init_scroller(".sidebar-scroller")
  
  if $(".tinymce").length > 0
    tinyMCE.init
      mode: "specific_textareas",
      editor_selector: 'tinymce',
      theme: 'advanced'

  
  #
  #
  #
  if $("#piousbox_layout").length > 0
  
    if HF.header_expanded() == true
      HF.expand_header()
    else
      HF.collapse_header()

    if HF.footer_expanded() == true
      HF.expand_footer()
    else
      HF.collapse_footer()

    $("#footer_expand a").click ->
      HF.toggle_footer()

    $("#header_expand a").click ->
      HF.toggle_header()
      
    #  
    #
    #
    if $("#dashboard").length > 0

      # U.views.days = new Views.Days.Index()

      $("a.scratchpad").click ->
        U.views.users.pad = new Views.Users.Pad()

      $("a.days_index").click ->
        U.views.days.index = new Views.Days.Index()
        
        
  if $("#cities_index").length > 0
    feature_cities_selected = true

    if feature_cities_selected
      CanvasOps.homepage_feature_cities()
    else
      CanvasOps.homepage_all_cities()
    
    
  if $("#layout_ultra").length > 0
  
    if $("#header_main").length > 0
      setup_scroller("#header_main")
    
    if $("#header_one").length > 0
      setup_scroller("#header_one")
      
    if $("#header_two").length > 0
      setup_scroller("#header_two")
      
setup_scroller = (which) ->
  
  ws = 0
  $.each $(which + " .scroller > *"), (idx, item) ->
    w = $(which + " .scroller > *").eq(idx).width()
    ws += w
  $(which + " .scroller").width(ws + 20)