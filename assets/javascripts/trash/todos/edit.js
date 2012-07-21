


App.Views.Edit = Backbone.View.extend({
  events: {
    "submit form": "save"
  },
    
  initialize: function() {
    this.render();
  },
    
  save: function() {
    var self = this;
    var msg = this.model.isNew() ? 'Successfully created!' : "Saved!";
        
    this.model.save({
      name: this.$('[name="todo[name]"]').val(), 
      descr: this.$('[name="todo[descr]"]').val()
    }, {
      success: function(model, resp) {
        new App.Views.Index;
                
        self.model = model;
        self.render();
        self.delegateEvents();

        Backbone.history.saveLocation('/todos/' + model.id);
        window.location.hash = '';
      },
      error: function() {
        new App.Views.Error();
      }
    });
  },
    
  render: function() {
    var out = '<form>';
    out += "<label for='todo[name]'>Name</label>";
    out += "<input name='todo[name]' type='text' />";
    out += '<br />';
        
    out += "<label for='todo[descr]'>Descr</label>";
    out += "<textarea name='todo[descr]'>" + (this.model.escape('descr') || '') + "</textarea>";
    out += '<br />';
        
    var submitText = this.model.isNew() ? 'Create' : 'Save';
        
    out += "<button>" + submitText + "</button>";
    out += "</form>";
    
    out += '<a href=#>Index</a>';

    $(this.el).html(out);
    $('#app').html(this.el);
        
    this.$('[name="todo[name]"]').val(this.model.get('name')); // use val, for security reasons
  }
});

