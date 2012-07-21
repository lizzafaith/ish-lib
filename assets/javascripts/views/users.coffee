
$(document).ready ->


  #
  #
  #
  Views.Users.Pad = Backbone.View.extend
  
    el: "#scratchpad"
    
    events:
      'click .save': 'update_pad'
      
    initialize: ->
      self = this
      
      _.bindAll this, 'render', 'hide', 'update_pad', 'populate_form'
      
      this.model = new Models.User( username: 'piousbox' )
        
      this.render()
      
    render: ->

      if U.views.days.index == undefined
        $("#main").hide()
      else
        U.views.days.index.hide()
        
      $(this.el).show()
      
    hide: ->
      $(this.el).hide()
      return this
      
    update_pad: ->
    
      data =
        pad: $("form.pad textarea").val()
        
      $.post "/pad", data, (incoming) ->
        U.log 'updated pad'
      
    populate_form: (data) ->
      $("#scratchpad textarea").html(data)