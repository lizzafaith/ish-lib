


$(document).ready(function() {
  
  App.Collections.CitiesUsers = Backbone.Collection.extend({
    model: App.Models.CitiesUser,
    // there is this.collection.models yes?
    url: '/cities_users',
    
    initialize: function() {
      this.fetch({
        success: function(collection, response) {
          $('#cities_users').html('')
          _.each(collection.models, function(item) {
            new App.Models.CitiesUser(item)
          })
          
          // cities users done loaded
          App.Instances.addritems = new App.Collections.Addritems()
          App.Instances.venues = new App.Collections.Venues()
        }
      })
    }
  })
  
})