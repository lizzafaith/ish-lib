
$(document).ready(function() {
  
  App.Routers.CitiesUsers = Backbone.Router.extend({
    routes: {
      '': 'index',
      '!': 'index',
      
      '!/cities_users/new': 'cu_new',
      '!/cities_users/:id': 'cu_show',
      
      '!/venues/new/in_cities_user/:cities_user_id': 'venues_new',
      '!/venues/:id/destroy': 'venues_destroy',
      
      '!/addritems/new/in_cities_user/:cities_user_id': 'addritems_new',
      '!/addritems/:id/destroy': 'addritems_destroy'
    },
    
    index: function() {
//      new Loading()
//      $.getJSON('/cities_users.json', function(data) {
//        if(data) {
//          var cities_users = _(data).map(function(i) {
//            return new App.Models.CitiesUser(i)
//          })
//          window.index = new Index({
//            collection: cities_users
//          })
//        } else {
//          new Error({
//            message: "Error loading documents."
//          })
//        }
//      })
    },
    
    venues_destroy: function(id) {
      _.each(App.Instances.venues.models, function(item) {
        if (item.get('id') == id)
          item.destroy()
      })
    },
    
    venues_new: function(cities_user_id) {
    },
    
    addritems_new: function() {
    },
    
    addritems_destroy: function(id) {
      _.each(App.Instances.addritems.models, function(item) {
        if (item.get('id') == id)
          item.destroy()
      })
    }
  })
  
})