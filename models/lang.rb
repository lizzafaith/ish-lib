

class Lang < NoModel
  
  field :name, :type => String
  field :abbr, :type => String
  
  validates_presence_of :name
  validates_presence_of :abbr
  validates_length_of :abbr, :is => 3
  
end
