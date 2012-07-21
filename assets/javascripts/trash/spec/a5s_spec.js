

describe('A5s specker', function() {
  
  beforeEach(function() {
    // second field!
    which = '2'
    which_field = $('.a5s-index li.' +which+ ' input')
    w = '.a5s-index li.' +which+ ' input'
      
    // create the dom piece
    var a = $('<input>')
    var b = $('<li>').attr('class', which).append(a)
    var c = $('<ul>').append(b)
    d = $('<div>').attr('class', 'a5s-index').append(c)
    $('body').append(d)
  })
  
  afterEach(function() {
    d.remove()
  })
  
  describe('save a5', function() {
    it('should put an item from the field to the local storage', function() {
    
      // reset field
      $('.a5s-index li.' +which+ ' input').val('')
      // reset localStorage
      localStorage.removeItem(which)
    
      // make sure that the local storage is empty for this particualr field
      var result = localStorage.getItem(which)
      expect(result).toBeNull()
      // write shit in the field
      var new_value = 'blah blah blah'    
      $('.a5s-index li.' +which+ ' input').val(new_value)
      // push button
      a5s_save(which)
      // make sure that the same shit is in the localstorage now
      result = localStorage.getItem(which)
      expect(result).toEqual(new_value)
    })
  })

  describe('clear a5', function() {
    it('should clear an item from the form field', function() {
      // write stuff in the field
      var new_value = 'new value to test clear()'
      $(w).val(new_value)
      // make sure that there is stuff in the field
      expect($('.a5s-index li.' +which+ ' input').val()).toEqual(new_value)
      // push button
      a5s_clear(which)
      // make sure there aint no stuff in the field
      expect($(w).val()).toEqual('')
    })
    
    it ('should also clear the local storage', function() {
      // make sure the localStorage is non-empty
      expect(localStorage.getItem(which)).toBeDefined()
      // push button
      a5s_clear(which)
      // make sure it is empty
      expect(localStorage.getItem(which)).toBeNull()
    })
  })

  describe('load a5s from local storage', function() {
    it('should spit out whatever is stored, when I load the page', function() {
      // make sure that localstorage is nonempty
      var value = 'newnew_value'
      localStorage.setItem(which, value)
      var result = localStorage.getItem(which)
      expect(result).toEqual(value)
      
      // make sure that the field is empty
      result = $(w).val()
      expect(result).toEqual('')
      
      // push button
      a5s_populate()
      
      // make sure that there is stuff in there
      result = $(w).val()
      expect(result).toEqual(value)
    })
  })

  describe('autosave', function() {
    it('should fucking autosave', function() {
      var n_value = 'nnnew value'
      // write stuff in the field
      $(w).val(n_value)
      // make sure that the stuff in localstorage is not the same as in the field
      expect(localStorage.getItem(which)).toNotEqual(n_value)
      // wait or trigger autosave?
      a5s_autosave()
      // make sure that the stuff in localstorage is the same as in the field
      expect(localStorage.getItem(which)).toEqual(n_value)
    })
  })

})


