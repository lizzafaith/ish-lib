

$(document).ready(function() {
  
  AddritemsNew = Backbone.View.extend({
  
    el: $('body'),
    
    events: {
      "click .close": 'close'
    },
    
    render: function() {
      // $(this.el).append("<h1>H1</h1>");
      return this;
    },
    
    initialize: function(data) {
      _.bindAll(this, 'render', 'close');
      this.render();
      this.el = $('#addritemsNew');
      this.el.css('display', 'block');
      return this;
    },
    
    close: function() {
      this.el.css('display', 'none');
    }
  });
  
});