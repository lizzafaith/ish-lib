

class NoReport < NoModel2
  
  has_and_belongs_to_many :no_videos
  has_and_belongs_to_many :no_galleries
  has_and_belongs_to_many :no_venues
  
  
  def self.home_features
    self.public.features.desc(:created_at).limit(4)
  end
  
  has_many :no_photos
  belongs_to :no_user
  belongs_to :no_city
  
  field :tags, :type => Array
  
  
  def photo
    self.no_photos[0]
  end
  
  field :subhead, :type => String
  
  def user
    self.no_user
  end
  
  def galleries
    self.no_galleries
  end
  
  def videos
    self.no_videos
  end
  
  def recommended
    NoReport.all.public.feature.limit(4)
  end
  
  def city
    self.no_city
  end
  
  def self.features n = 6
    self.public.feature.desc(:created_at).limit(6)
  end
  
end