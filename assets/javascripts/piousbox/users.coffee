
$(document).ready ->
        
  if $('#users_show').length > 0
  
    # Utils.scroll_to('#users_show')

    if $("#layout_light_semantic").length > 0
      Utils.init_scroller( '#users_header', 'scroller-fixed' )

    id = $(".ids").attr('user_id')
    CanvasOps.users_show_initialize(id)