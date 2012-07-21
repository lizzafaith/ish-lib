


$(document).ready(function() {
  
  App.Views.Venues.Show = Backbone.View.extend({
    
    render: function() {
      var m = this.model
      
      var a_edit = $('<a>').attr('href', '#!/venues/'+ m.get('id') +'/edit').html('[~]')
      var a_delete = $('<a>').attr('href', '#!/venues/'+ m.get('id') +'/destroy').html('[x]')
      var elem = $('<li>').addClass('venue_' + m.get('id')).append(a_edit).append(m.get('name')).append(a_delete)
      
      var append_to = $('.cities_users_'+ m.get('cities_user_id') +' .venues')
      append_to.append(elem)
   
      return this
    },
    
    initialize: function(data) {
      _.bindAll(this, 'render', 'remove')
      this.model = data
      this.render()
      this.model.bind('destroy', this.remove, this);
      this.el = $('.venue_' + this.model.get('id'))
    },
  
    remove: function() {
      $(this.el).remove()
    }
  })
})