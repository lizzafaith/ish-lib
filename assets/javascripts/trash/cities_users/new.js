

$(document).ready(function() {
  
  CUNew = Backbone.View.extend({
  
    el: '#cuNew',
    
    events: {
      "click input[type=submit]": 'submit',
      "click .close": 'close'
    },
    
    options: {},
    
    render: function() {
      $(this.el).css('display', 'block');
      var elem = $.ajax({
        url: '/cities_users/new/minimal.html',
        method: 'get',
        success: function(data) {
          $("#cuNew .content").html(data)
        }
      })
      
      // alert(this.data);
    },
   
    close: function() {
      $(this.el).css('display', 'none');
    },
    
    submit: function() {
      
    //      var cu_id = $("input[name='venue[cities_user_id]']").val()
    //      var venues_dom = ".cities_user_"+ cu_id +" .venues"
    //      var options = {
    //        name: $("input[name='venue[name]']").val(),
    //        descr: cu_id,
    //        cities_user_id: $("input[name='venue[cities_user_id]']").val()
    //      };
    //      var venue = new Venue()
    //      venue.save(options)
    //
    //      var venues_index = VenuesIndex({
    //        el: venues_dom,
    //        options: {
    //          cities_user_id: cu_id
    //        }
    //      })
    //      venues_index.render()
    //
    //      this.close()
    //      return false;
    },
    
    initialize: function(data) {
      _.bindAll(this, 'render', 'close', 'submit');
      this.render();
      return this;
    }
    
  });
  
});






