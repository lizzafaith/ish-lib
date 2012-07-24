





class NoVenue < NoModel2

  has_and_belongs_to_many :no_reports
  
  field :venue_type_names, :type => Array
  field :address, :type => String
  
  def venue_type
    venue_type_names[0]
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
  
  def reports
    self.no_reports
  end
  
  def events
    []
  end
  
  def galleries
    []
  end
  
end