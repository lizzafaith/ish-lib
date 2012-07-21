
/**
 * functions
 */

function a5s_save(which) {
  var value = $('.a5s-index li.' +which+ ' input').val()
  localStorage.setItem(which, value)
}

function a5s_clear(which) {
  $('.a5s-index li.' +which+ ' input').val('')
  localStorage.removeItem(which)
}

function a5s_populate() {
  for(var i=1; i<=5; i++) {
    $('.a5s-index li.' +i+ ' input').val(localStorage.getItem(i))
  }
}

function a5s_autosave() {
  for(var i=1; i<=5; i++) {
    localStorage.setItem(i, $('.a5s-index li.' +i+ ' input').val())
  }
}
function generate_save_event(j) {
  return function() {
    a5s_save(j)
  }
}
function generate_delete_event(j) {
  return function() {
    a5s_clear(j)
  }
}

$(document).ready(function() {  
  /**
   * bindings
   */
  // autosave
  $('.a5s-index .save-all').on('click', function() {
    a5s_autosave()
  })
  for (var b=1; b<=5; b++) {
    $('.a5s-index li.'+ b +' .save').on('click', generate_save_event(b))
    $('.a5s-index li.'+ b +' .clear').on('click', generate_delete_event(b))
    $('.a5s-index li.'+ b +' input').on('blur', generate_save_event(b))
    
  }  
  
  /**
   * init
   */
  a5s_populate()
})
