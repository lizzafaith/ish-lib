


$(document).ready(function() {
  
  App.Collections.Addritems = Backbone.Collection.extend({
    model: App.Models.Addritem,
    url: '/addressbookitems',
    
    initialize: function() {
      this.fetch({
        success: function(collection, response) {
          _.each(collection.models, function(item) {
//            new App.Models.Addritem(item)
          })
        }
      })
    }
  })
  
})

