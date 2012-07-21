
class Todo
  
  include Mongoid::Document
  
  def self.max_count
    5
  end
  
end
