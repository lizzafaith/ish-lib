

$(document).ready(function() {
  var TodosCollection = Backbone.Collection.extend({
  
    model: App.Models.Todo,
    url: '/todos',
  
    old: function() {  
      return this.filter(function(todo) {  
        return todo.get('is_active') == 0;  
      });  
    },
  
    // from a tutorial
    done: function() {
      return this.filter(function(todo){
        return todo.get('done');
      });
    },
    
    // from a tutorial
    remaining: function() {
      return this.without.apply(this, this.done());
    }
  
  })
})