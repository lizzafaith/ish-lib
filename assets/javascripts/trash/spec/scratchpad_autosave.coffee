
describe "Views", ->

  describe "Users", ->
  
    describe 'scratchpad autosave', ->
      beforeEach ->
        a = 'a'
        
      it 'should issue a js call every minute', ->
        a = 'a'
        
      it 'kicks it', ->
        
        # take contents of the textarea
        
        # 
  
    beforeEach ->
      new App.Routers.CitiesUsers()
      App.Instances.cities_users = new App.Collections.CitiesUsers()

    it "Should have the models up", ->
      expect(App.Models.Addritem).toBeDefined()
      expect(App.Models.CitiesUser).toBeDefined()

    it "Instantiates the app", ->
      expect(App.Instances.cities_users).toBeDefined()