var new_item;
new_item = function() {
  return alert('new item func');
};
$('document').ready(function() {
  var delete_todo, i, size;
  new_item = function(i) {
    var a, li;
    a = $('<a>').attr('class', 'delete').html('[x]');
    li = $('<li>').attr('class', i).html(localStorage.key(i));
    li.append(a);
    return $('.todos .index').append(li);
  };
  delete_todo = function(i) {
    var key;
    key = localStorage.key(i);
    localStorage.removeItem(key);
    return $('li.' + i).remove();
  };
  size = localStorage.length;
  $('input.submit').click(function() {
    var key, val;
    val = $('input.name').val();
    key = size++;
    localStorage.setItem(key, val);
    new_item(key);
    return false;
  });
  i = 0;
  while (i < localStorage.length) {
    new_item(i);
    i++;
  }
  $('a.delete').each(function(idx) {
    var number;
    number = $(this).parent().attr('class');
    return $(this).bind('click', function() {
      return delete_todo(number);
    });
  });
  return false;
});