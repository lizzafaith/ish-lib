


Swooshit.init = (opts) ->

  $.each $('.' + opts.ctrl + ' .page-numbers span'), (idx) ->
    $('.' + opts.ctrl + ' .page-numbers span').eq(idx).on 'click', ->
      
      Utils.loading()
      
      
      w = $('.width-measure').width()
      n_milisec = 1000
      page_number = idx + 1
  
      string = "/" + opts.path + "/html_data/" + page_number
      $.get string, (data) ->
      
        $('.' + opts.ctrl + ' .swooshable-list-2').html(data)
      
        $('.' + opts.ctrl + ' .swooshable-list-1').animate
          marginLeft: '-=' + w
        , n_milisec, ->
        
        
        $('.' + opts.ctrl + ' .swooshable-list-2').animate
          marginLeft: '-=' + w
        , n_milisec, ->
          # done
          $('.' + opts.ctrl + '-close').css('display', 'inline')
          
          $('.' + opts.ctrl + ' .swooshable-list-1').css('margin-left', 0)
          $('.' + opts.ctrl + ' .swooshable-list-2').css('margin-left', w)
          $('.' + opts.ctrl + ' .swooshable-list-1').html(data)
          $('.' + opts.ctrl + ' .swooshable-list-2').html('')
          
          $('.' + opts.ctrl + ' .page-numbers span').each (idx_2) ->
            $('.' + opts.ctrl + ' .page-numbers span').eq(idx_2).removeClass('selected')
          $('.' + opts.ctrl + ' .page-numbers span').eq(idx).addClass('selected')
        
        
        Utils.loaded()
        
  if opts.load_first
    $('.' + opts.ctrl + ' .page-numbers span').eq(0).trigger('click')
    
        
Swooshit.set_scroller_width = ->
  width = $('.width-measure').width()
  $('.scroller').css('width', width)
  $('.swooshable-list-1').css('width', width)
  $('.swooshable-list-2').css('width', width)
  $('.swooshable-list-2').css('margin-left', width)
  
$(window).resize ->
  Swooshit.set_scroller_width()