





class NoVenue < NoModel2

  has_and_belongs_to_many :no_reports
  
  belongs_to :no_city
  belongs_to :no_user
  
  has_one :no_photo
  
  def user= arg
    self.no_user = arg
  end
  
end