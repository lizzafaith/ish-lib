

$(document).ready(function() {
  
  VenuesNew = Backbone.View.extend({
  
    el: $('#venuesNew'),
    
    events: {
      "click input[type=submit]": 'submit',
      "click .close": 'close'
    },
    
    options: {},
    
    render: function() {
      $(this.el).css('display', 'block');
      
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
   
    close: function() {
      $(this.el).css('display', 'none');
    },
    
    submit: function() {
      
      var cu_id = $("input[name='venue[cities_user_id]']").val()
      var venues_dom = ".cities_user_"+ cu_id +" .venues"
      var options = {
        name: $("input[name='venue[name]']").val(),
        descr: cu_id,
        cities_user_id: $("input[name='venue[cities_user_id]']").val()
      };
      var venue = new Venue()
      venue.save(options)

      var venues_index = VenuesIndex({
        el: venues_dom,
        options: {
          cities_user_id: cu_id
        }
      })
      venues_index.render()

      this.close()
      return false;
    // get info from the form
    // ajaxian post it
    // render success or failure
    // add to the presentation.
    },
    
    initialize: function(data) {
      this.options['cities_user_id'] = data
      _.bindAll(this, 'render', 'close', 'submit');
      this.render();
      return this;
    }
    
  });
  
});






