
describe "U", ->

  beforeEach ->
    console = $("<div>").attr('id', 'log_main')
    $('body').append console

  afterEach ->
    $("#console").remove()
    $("#log_main").remove()

  describe "logger", ->
    it "should log", ->
      
      
      
      expect($("#log_main")).toBeDefined()
      
      str = 'test logging'
      U.log(str)
      
      result = $("#log_main div").html()
      expect(result).toEqual(str)
      # expect(HF.footer_expanded()).toBeFalsy()