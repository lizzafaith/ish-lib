


$(document).ready(function() {
    
  App.Views.CitiesUsers.Index = Backbone.View.extend({
    el: $('#cities_users'),

    addOne: function(model) { 
      var view = new App.Views.CitiesUsers.Show({
        model: model
      });
      view.render(); 
      $(this.el).append(view.el);
      model.bind('remove', view.remove);
    },
    
    addAddritem: function(model) {
      
    },
    
    addVenue: function(model) {
      
    },

    render: function() {
      
      var addritems = this.collection['addritems']
      addritems.each(this.addAddritem)
      
      var venues = this.collection['venues']
      venues.each(this.addVenue)
      
      // @todo
      // herehere
      
      $(this.el).html(elem);      

      return this;
    },
  
    initialize: function() {
      _.bindAll(this, 'render', 'addOne');
//      this.options.collection.bind('add', this.addOne);
    // this.render();
    }
  })
  
})
