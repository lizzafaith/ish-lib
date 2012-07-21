

# old issue does not even have to be taken out from mysql, there is nothing there

class NoIssue
  
  include Mongoid::Document
  
  field :date, :type => Date
  
  has_many :no_videos
  
end
