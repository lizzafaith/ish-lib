

class Error
  
  include Mongoid::Document
  
  field :referrer, :type => String
  field :url, :type => String
  field :type, :type => String
  
  field :date_time, :type => DateTime, :default => DateTime.now
  
end