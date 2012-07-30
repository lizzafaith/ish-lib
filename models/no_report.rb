

class NoReport < NoModel2
  
  has_and_belongs_to_many :no_videos
  has_and_belongs_to_many :no_galleries
  has_and_belongs_to_many :no_venues
  
  
  def self.home_features
    self.public.features.desc(:created_at).limit(4)
  end
  
  belongs_to :no_user
  
  
  field :subhead, :type => String
  
  # create if does not exist
  def self.old_or_new args
    old = NoReport.where( :seo => args[:seo] ).first
    if old.blank?
      old = NoReport.new :name => args[:name], :seo => args[:seo]
      old.save
    end
    
    return old
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
  
  has_many :no_photos
  def photo
    self.no_photos[0]
  end
  
  belongs_to :no_city
  def city
    self.no_city
  end
  
  belongs_to :no_user
  def user
    self.no_user
  end
  
  def self.features n = 6
    self.public.feature.desc(:created_at).limit(n)
  end
  
end