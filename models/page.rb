

class Page
  
  include Mongoid::Document
 
  belongs_to :no_user
  
  field :title, :type => String
  field :seo, :type => String
  
  field :body, :type => String
  
  def to_param
    return self.seo unless self.seo.blank?
    
    self._id
  end
  
end

