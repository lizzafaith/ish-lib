
describe "Days", ->

  beforeEach ->
    a = $("<div>").attr('id', 'main')
    b = $("<div>").addClass('index')
    a.append b
    $('body').append a

  afterEach ->
    # $("#main").remove()

  describe "views", ->
  
    it "should show index", ->
  
      # create the view
      U.views.days.index = new Views.Days.Index()
      
      r = U.views.days.index.collection
      
      setTimeout ->

        expect( r.length > 0 ).toBeTruthy()

        result = $("#main .index li")

        expect( result.length > 0 ).toBeTruthy()
        expect( result.length ).toEqual( 7 )        
        
      , 1