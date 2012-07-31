

$(document).ready ->

  


  if $("#manager_galleries_index").length > 0
    
    checkboxes = $('.galleries input[type="checkbox"]')
    $.each checkboxes, (idx, item) ->
      this_checkbox = $('.galleries input[type="checkbox"]').eq(idx)
      this_checkbox.on 'click', ->
        if this_checkbox.attr('checked') == 'checked'
          mark = 1
        else
          mark = 0

        id = this_checkbox.attr('name')
        path = "/galleries/" + id.to_string + "/edit"
        
        Utils.loading()
        $.post path,
          id: id
          is_feature: mark, (x) ->
            this_checkbox.attr('checked', x)
            Utils.loaded()
            