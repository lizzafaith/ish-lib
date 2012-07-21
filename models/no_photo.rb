

class NoPhoto
  
  include Mongoid::Document
  
  belongs_to :no_report
  belongs_to :no_venue
  belongs_to :no_user
  
end