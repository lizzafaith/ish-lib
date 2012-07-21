
$(document).ready ->


  #
  #
  #
  Views.Days.Show = Backbone.View.extend
  
    el: $("#main .index")
    
    events:
      'click a.delete': 'delete_item'
      
    initialize: (item) ->
      this.model = item
      
      _.bindAll this, 'render', 'delete_item'
      
      this.render()

    render: ->
      str = "<li>Day " + this.model.get('date') + ' '
      str += "<a class='delete'>[x]</a> "
      str += "</li> "
      
      $('ul', this.el).append str
      
    delete_item: ->
      U.log 'removing ' + this.model.get('id')
      U.temp2 = this


  #
  #
  #
  Views.Days.Index = Backbone.View.extend
  
    el: $("#main")
    el_new: $('#days_new_container')
    
    events:
      'click #days_new_hide': 'new_day_hide'
      'click a.days_new_show': 'new_day'
      "submit form.new_day": "new_day"


    initialize: ->
      
      _.bindAll this, 'render', 'append_item', 'remove_item', 'new_day', 'new_day_hide', 'create_day', 'hide'
      
      this.collection = new Collections.Days()
      
      this.collection.bind 'add', this.append_item
      this.collection.bind 'remove', this.remove_item
      
      
    render: ->
      self = this
      
      if U.views.users.pad == undefined
        ;
      else
        U.views.users.pad.hide()
      
      str = '<h1>Days Index '
      str += "<a class='days_new_show'>[+]</a>"
      str += '</h1>'
      str += '<ul></ul>'
      
      $('.index', this.el).html str
      $(this.el).show()
      
      _(this.collection.models).each (item) ->
        a = new Views.Days.Show(item)

    append_item: (item) ->
      ;
      
    remove_item: (item) ->
      ;
      
    new_day: ->
      U.log 'showing new day container'
      $(this.el_new).show()
      
    new_day_hide: ->
      U.log 'hide new day'
      $(this.el_new).hide()
    
    create_day: ->
      U.log 'new day'
      
      date = $("form.new_day input[name='date']").val()
      a1 = $("form.new_day input[name='a1']").val()
      a2 = $("form.new_day input[name='a2']").val()
      
      model = new Models.Day
        date: date
        a1: a1
        a2: a2
      model.save()
    
    hide: ->
      $(this.el).hide()