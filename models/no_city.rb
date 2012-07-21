

class NoCity
  
  include Mongoid::Document
  
  field :name, :type => String
  field :seo, :type => String
  
  embeds_one :no_country
  
  has_many :no_videos
  has_many :no_reports
  has_many :no_venues
  
  
end
