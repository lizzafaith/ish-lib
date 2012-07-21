
$(document).ready(function() {

  App.Models.CitiesUser = Backbone.Model.extend({
    
    initialize: function(data) {
      data.view = new App.Views.CitiesUsers.Show(this)
    }
    
  })
  
})