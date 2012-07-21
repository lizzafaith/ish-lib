
$(document).ready(function() {
  
  Loading = Backbone.View.extend({
    el: $('#cities_users'),
    template_str: $('#loadingTemplate').html(),
    render: function() {
      $(this.el).html(_.template(this.template_str));
      return this;
    },
    initialize: function() {
      _.bindAll(this, 'render');
      this.render();
      return this;
    }
    
  })
  
})