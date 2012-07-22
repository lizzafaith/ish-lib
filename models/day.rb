

class Day
  
  include Mongoid::Document
  
  field :date, :type => String
  
  field :a1, :type => String
  field :a2, :type => String
  field :a3, :type => String
  field :a4, :type => String
  field :a5, :type => String
  
  belongs_to :no_user
end