
describe('Views', function() {

  describe("Days", function() {
    beforeEach(function() {
      // load one day
      // load day 2
      })
  
    it("should have a collection of day views", function() {
    
      })
  
    it("should display a day", function() {
      var episode = new Backbone.Model({
        title: "Hollywood - Part 2"
      })
      expect(episode.get("title")).toEqual("Hollywood - Part 2")
    })
    
  })
  
  describe("Interacting with a server", function() {
    beforeEach(function() {
      this.fixture = this.fixtures.Todos.valid;
      this.server = sinon.fakeServer.create()
      this.server.respondWith(
        "GET", "/todos",
        this.validResponse(this.fixture)
        )
      this.todos = new Todos()
    })

    afterEach(function() {
      this.server.restore();
    })

    it("should make the correct request", function() {
      this.todos.fetch();
      expect(this.server.requests.length).toEqual(1);
      expect(this.server.requests[0].method).toEqual("GET");
      expect(this.server.requests[0].url).toEqual("/todos");
    })
    
    it("should parse todos from the response", function() {
      this.todos.fetch()
      this.server.respond()
      expect(this.todos.models.length).toEqual(this.fixture.response.todos.length);
      window.todos = this.todos
      expect(this.todos.get(1).get('title')).toEqual(this.fixture.response.todos[0].title);
    })

  })
  
  describe('Ordering', function() {
    beforeEach(function() {
      this.todo1 = new Backbone.Model({
        id: 1,
        title: 'Todo 1',
        priority: 3
      });
      this.todo2 = new Backbone.Model({
        id: 2,
        title: 'Todo 2',
        priority: 2
      });
      this.todo3 = new Backbone.Model({
        id: 3,
        title: 'Todo 3',
        priority: 1
      });
      this.todos = new Todos()
    })

    it("should order models by priority", function() {
      this.todos.add([this.todo1, this.todo2, this.todo3]);
      expect(this.todos.at(0)).toBe(this.todo3);
      expect(this.todos.at(1)).toBe(this.todo2);
      expect(this.todos.at(2)).toBe(this.todo1);
    });


  })
  
  describe("when instantiated with model literal", function() {
    beforeEach(function() {
      this.todoStub = sinon.stub(window, "Todo");
      this.model = new Backbone.Model({
        id: 5, 
        title: "Foo"
      });
      this.todoStub.returns(this.model);
      this.todos = new Todos();
      this.todos.model = Todo; // reset model relationship to use stub
      this.todos.add({
        id: 5, 
        title: "Foo"
      });
    });
    
    afterEach(function() {
      this.todoStub.restore();
    });

    it("should add a model", function() {
      expect(this.todos.length).toEqual(1);
    });
    
    it("should find a model by id", function() {
      expect(this.todos.get(5).get("id")).toEqual(5);
    });
  });


  
  describe("Todo model", function() {
    beforeEach(function() {
      this.todo = new Todo({
        title: 'Rake leaves'
      })
      var collection = {
        url: "/collection"
      };
      this.todo.collection = collection;
      this.eventSpy = sinon.spy();
      this.todo.bind("error", this.eventSpy);
      this.todo.save({
        "title": ""
      });
    })
    
    describe("when no id is set", function() {
      it("should return the collection URL", function() {
        expect(this.todo.url()).toEqual("/collection");
      });
    });

    describe("when id is set", function() {
      it("should return the collection URL and id", function() {
        this.todo.id = 1;
        expect(this.todo.url()).toEqual("/collection/1");
      })
    })
    
    describe('when instantiated', function() {
      it("should not save when title is empty", function() {
        expect(this.eventSpy).toBeDefined()
        expect(this.eventSpy.calledOnce).toBeTruthy();
        expect(this.eventSpy.calledWith(
          this.todo, 
          "cannot have an empty title"
          )).toBeTruthy();
      });


      it('should set the priority to default', function() {
        expect(this.todo.get('priority')).toEqual(3);
      });


      it("should set the URL to the collection URL", function() {
        var collection = {
          url: "/collection"
        };
        this.todo.collection = collection;
        expect(this.todo.url()).toEqual("/collection");
      });


      it('should exhibit attributes', function() {
        var todo = new Todo({
          title: 'Rake leaves'
        })
        expect(todo.get('title'))
        .toEqual('Rake leaves');
      })
    
    })
  })
})