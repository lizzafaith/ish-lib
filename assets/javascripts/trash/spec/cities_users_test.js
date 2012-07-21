
describe('Views', function() {

  describe("CitiesUsers", function() {
    
    beforeEach(function() {
      new App.Routers.CitiesUsers()
      App.Instances.cities_users = new App.Collections.CitiesUsers()
    })
    
    it("Should have the models up", function() {
      expect(App.Models.Addritem).toBeDefined()
      expect(App.Models.CitiesUser).toBeDefined()
    })
      
    it("Instantiates the app", function() {
      expect(App.Instances.cities_users).toBeDefined()
    })
    
  })
  
})




