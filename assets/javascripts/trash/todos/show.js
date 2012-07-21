

App.Views.Show = Backbone.View.extend({  
  
     
  initialize: function() {
    this.render();
  },
  
  render : function() {
    this.model.get('name');
    
    var line = '';
    var context = {
      model: this.model
    }
    
    line += "<h3><%= model.escape('name') %></h3>\n\
<%= model.escape('descr') %><br />\n\
<ul><li><a href='#'>Back to Index</a></li></ul>";
    
    $(this.el).html(_.template(line, context));
    $('#app').html(this.el);
  }

});