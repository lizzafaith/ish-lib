


$(document).ready(function() {
  
  App.Collections.Venues = Backbone.Collection.extend({
    model: App.Models.Venue,
    url: '/my/venues',
    
    initialize: function() {
      this.fetch({
        success: function(collection, response) {
          _.each(collection.models, function(item) {
//            new App.Models.Venue(item)
          })
        }
      })
    }
  })
  
})

