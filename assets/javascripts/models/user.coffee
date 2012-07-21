

$(document).ready ->

  #
  #
  #
  Models.User = Backbone.Model.extend
  
    url: ->
      if this.get('username')
        return "/users/show/" + this.get('username')
      else if this.id
        return "/users/" + this.id
      else
        return "/users"
        
    initialize: ->
      _.bindAll this, 'success'      
      this.fetch
        success: this.success
      
    success: (model, response) ->
      U.views.users.pad.populate_form(response.scratchpad)

  #
  #
  #
  Collections.Users = Backbone.Collection.extend
  
    model: Models.User
    
    
    initialize: ->
      this.fetch
        success: this.success
        error: this.error
        
    success: ->
      ;
      
    error: ->
      U.log 'collection NOT loaded!!!'
      
      