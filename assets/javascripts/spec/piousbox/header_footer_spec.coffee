
describe "HeaderFooter", ->

  beforeEach ->
    # hf = HF

  afterEach ->
    # ;

  describe "toggle header", ->
    it "should expand header", ->
      HF.header_expanded(false)
      expect(HF.header_expanded()).toBeFalsy()
      
      HF.toggle_header()
      
      expect(HF.header_expanded()).toBeTruthy()
      
    it 'should collapse footer', ->
      $('body').append($("div").attr('id', "footer_main"))
      
      footer = $("#footer_main")
      expect(footer.length).toBeDefined()
      
      HF.footer_expanded(true)
      HF.toggle_footer()
      
      expect(HF.footer_expanded()).toBeFalsy()
      
      collapsed = -U.logo
      bottom = $("#footer_main").css('bottom')
      bottom = parseInt(bottom)
      expect(bottom).toEqual(collapsed)