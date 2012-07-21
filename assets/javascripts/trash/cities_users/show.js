


$(document).ready(function() {
  
  App.Views.CitiesUsers.Show = Backbone.View.extend({
    el: $('#cities_users'),
    
    render: function() {
      var cu = this.model
      
      var elem = $('<div>').addClass('cities_users_' + cu.get('id'))

      var title = $('<h3>').html(pretty_date(cu.get('date')) +' - '+ cu.get('name') + ' ')
      var a_edit = $('<a>').attr('href', '#!/cities_users/' + cu.get('id') + '/edit').html('[~]')
      title.append(a_edit)
      var a_new_venue = $('<a>').attr('href', '#!/venues/new/in_cities_user/' + cu.get('id')).html('[+venue]')
      title.append(a_new_venue)
      var a_new_addritem = $('<a>').attr('href', "#!/addressbookitems/new/in_cities_user/" + cu.get('id')).html('[+person]')
      title.append(a_new_addritem)
      title.append("<span class='" + cu.get('id') + "'>&nbsp;</span>")
      elem.append(title)

      var descr = $('<div>').addClass('width-third descr float-left').html(cu.get('descr').replace("\n", "<br />"))
      elem.append(descr)

      var venues_ul = $('<ul>').addClass('venues')
      var venues = $('<div>').addClass('width-third float-left').html(venues_ul)
      elem.append(venues)

      var addritems_ul = $('<ul>').addClass('addritems')
      var addritems = $('<div>').addClass('width-third float-left').html(addritems_ul)
      elem.append(addritems)

      elem.append($('<div>').addClass('clear'))
      
      $(this.el).append(elem)
      return this
    },
    
    initialize: function(data) {
      _.bindAll(this, 'render')
      this.model = data
      this.render()
    }
  })
})