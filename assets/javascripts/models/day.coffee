

$(document).ready ->

  #
  #
  #
  Models.Day = Backbone.Model.extend
  
    url: ->
      if this.id
        return "/days/" + this.id
      else
        return "/days"
        
  #
  #
  #
  Collections.Days = Backbone.Collection.extend
  
    model: Models.Day
    
    url: "/days"
    
    initialize: ->
      this.fetch
        success: this.success
        error: this.error
        
    success: ->
      U.log 'Done loaded'
      U.views.days.index.render()
      # U.views.days.new_day_hide()
      
    error: ->
      U.log 'collection NOT loaded!!!'
      
      