

App.Views.Index = Backbone.View.extend({
  
  events: {
    'click .refresh': 'refresh'
  },
  
  initialize: function() {
    _.bindAll(this, 'refresh');
    this.todos = this.options.todos;
//    this.model.bind('change:name', this.changeName);
//    this.model.bind('change:descr', this.changeDescr);
    this.render();
  },
    
  render: function() {
    var list = "";    
    var context = { 
      todos: this.todos
    };

    list += "<div class='todos index todos-index'>\n\
<% if (todos.length < 5) { %>\n\
<h3><a href='#/new'>[+]</a></h3>\n\
<% } %>\n\
\n\
<ul>\n\
<% _.each(todos, function(item) { %>\n\
<li>\n\
<a href='#/todos/<%=item.id%>/edit'>[~]</a>\n\
<a href='#/todos/<%=item.id%>'><%= item.escape('name') %></a>\n\
<a class='hide' href='#/todos/<%=item.id%>' data-method='delete' data-confirm='Are you sure?'>[x]</a>\n\
<form class='float-right' action='/todos/<%=item.id%>/delete' method='post'><input type='hidden' name='todo[id]' value='<%=item.id%>' /><input type='submit' value='[x]' /></form>\n\
</li>\n\
<% }); %>\n\
</ul>\n\
<a class='refresh' href='#'>Refresh</a>\n\
</div>";
    
    $(this.el).html(_.template(list, context));
    $('#app').html(this.el);
  },
  
  /* events */
  refresh: function() {
    /* it alerts */
    this.todo = this.options.todos;
    this.render();
  },
  
  changeName: function() {
    ;
  },
  
  changeDescr: function() {
    ;
  }
});

