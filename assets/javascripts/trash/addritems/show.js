


$(document).ready(function() {
  
  App.Views.Addritems.Show = Backbone.View.extend({
    
    render: function() {
      var m = this.options
      
      var a_edit = $('<a>').attr('href', '#!/addritems/'+ m.get('id') +'/edit').html('[~]')
      var a_delete = $('<a>').attr('href', '#!/addritems/'+ m.get('id') +'/destroy').html('[x]')
      
      var elem = $('addritem_'+ m.get('id'))
      if (elem.length > 0) {
        // nothing
      } else {
        elem = $('<li>').addClass('addritem_' + m.get('id'))
      }
      elem.html(a_edit).append(m.get('name')).append(a_delete)
      
      var append_to = $('.cities_users_'+ m.get('cities_user_id') +' .addritems')
      append_to.append(elem)
    },
    
    initialize: function() {
      
      _.bindAll(this, 'render', 'remove')
      this.el = $('.addritem_'+ this.options.get('id'))
      
      this.options.bind('destroy', this.remove, this)
      this.render()
    },
    
    remove: function() {
      $(this.el).remove()
    }
  })
})