
new_item = ->
  alert 'new item func'
  
$('document').ready ->

  #
  # define functions
  #
  
  new_item = (i) ->
    a = $('<a>').attr('class', 'delete').html('[x]')
    li = $('<li>').attr('class', i).html(localStorage.key(i))
    li.append(a)
    $('.todos .index').append(li)
    
  delete_todo = (i) ->
    key = localStorage.key(i)
    localStorage.removeItem(key)
    $('li.'+i).remove()
    
  #
  # init
  #
  size = localStorage.length
  
  # create new todo
  $('input.submit').click ->
    val = $('input.name').val()
    key = size++
    localStorage.setItem(key, val)
    new_item(key)
    false
  
  # build index list
  i = 0
  while i < localStorage.length
    new_item(i)
    i++
    
  # bind deletes
  $('a.delete').each (idx) ->
    number = $(this).parent().attr('class')
    $(this).bind 'click', ->
      delete_todo(number)

  false