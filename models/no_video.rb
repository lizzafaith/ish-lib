

class NoVideo < NoModel2
  
  field :youtube_url, :type => String
  field :w, :type => Integer
  field :h, :type => Integer
  
  has_and_belongs_to_many :no_reports
  has_and_belongs_to_many :no_galleries
  
  belongs_to :no_issue
  belongs_to :no_user
  belongs_to :no_city
  
  def self.related_to_report r
    self.where('video.reports.id' => r[:id])
    
  end
  
  def self.n_features() 5; end
  
  def self.first_feature
    self.first_features[0]
  end
  
  def self.first_features n = 1
    self.where(
      :is_public => 1, :is_trash => 0, :is_feature => 1
    ).limit(n).desc(:created_at)
  end
  
  def name
    self[:name]
  end
  
  # trash
  field :city_id, :type => Integer
  
  before_create :set_seo
  
  def set_seo
    self.seo = self.name.to_slug
  end
  
  
end

