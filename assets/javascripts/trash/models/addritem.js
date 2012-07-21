

$(document).ready(function() {
  
  App.Models.Addritem = Backbone.Model.extend({
    initialize: function(data) {
      new App.Views.Addritems.Show(this)
    }
  })


})