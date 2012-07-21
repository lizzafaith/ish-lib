

class NoGallery
  
  include Mongoid::Document
  
  field :title, :type => String
  field :seo, :type => String
  
  has_and_belongs_to_many :no_videos
  has_and_belongs_to_many :no_reports
  
end