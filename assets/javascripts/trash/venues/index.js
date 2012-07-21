

$(document).ready(function() {
  
  VenuesIndex = Backbone.View.extend({
    
    // el
    // options
    // events
    // data?
    
    render: function() {      
      // starter
      var elem = "<div class='close'><a>[x]</a></div>";
      elem += "<form type='post' action='/venues' onsubmit='return false;'>";
      
      elem += "<b>Name</b><input type='text' name='venue[name]' /><br />";
      elem += "<textarea name='venue[descr]'></textarea><br />";
      elem += "<input type='hidden' name='venue[cities_user_id]' value='"+ this.options['cities_user_id'] +"' />";
      elem += "<input type='submit' value='Submit' />";
      
      // ender
      elem += "</form>";
      
      $(this.el).html(elem);
      // $(this.el).append("<h1>H1</h1>"); // trash!!!!!
      return this;
    },
   
    initialize: function(data) {
      _.bindAll(this, 'render');
      
      var str = '/venues.json'
      if (this.options['cities_user_id'] > 0) {
        str = '/cities_users/' + this.options['cities_user_id'] + '/venues.json'
      }
      
      $.getJSON(str, function(data) {
        if (data) {
          var venues = _(data).map(function(i) {
            return new Venue(i)
          })
          new App.Views.Venues.Index({venues: venues})
        }
      })
      
      this.render();
      return this;
    }
    
  });
  
});






