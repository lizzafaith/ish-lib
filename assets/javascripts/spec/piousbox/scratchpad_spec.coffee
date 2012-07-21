
describe "Scratchpads", ->

  beforeEach ->
    console = $("<div>").attr('id', 'scratchpad').html('<h1>Scratchpad</h1>')
    # console.css('display', 'none')
    $('body').append console

  afterEach ->
    $("#scratchpad").remove()

  describe "show", ->
  
    it "should show the thing", ->
      
      expect($("#scratchpad")).toBeDefined()
      
      # here, new view
      U.views.users.pad = new Views.Users.Pad()
      U.views.users.pad.render()
      
      result = $("#scratchpad").css('display')
      expect(result).toEqual('block')
      
      U.views.users.pad.hide()
      
      r = $("#scratchpad").css('display')
      expect(r).toEqual('none')
      
    it 'shold load existing info', ->
      ;
      
    it 'should save', ->
      ;
      
    it 'should have autosave', ->
      expect( false ).toBeTruthy( 'todo' )