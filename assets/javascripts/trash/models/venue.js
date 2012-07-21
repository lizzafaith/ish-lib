

$(document).ready(function() {
  
  App.Models.Venue = Backbone.Model.extend({
    initialize: function(data) {
      data.view = new App.Views.Venues.Show(this)
    }
  })


})