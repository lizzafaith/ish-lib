

class ForUser
  
  include Mongoid::Document
  
  field :email, :type => String
  field :name, :type => String
  
  field :descr, :type => String
  field :scratchpad, :type => String
  
  field :dob, :type => Date
  
  field :x, :type => Float
  field :y, :type => Float
  
  field :group_id, :type => Integer
  
  include do
    # has_many :days
    has_many :pages
    has_many :no_videos
    has_many :no_reports
    has_many :no_venues
    has_many :days
  
    has_one :profile_photo, :class_name => 'NoPhoto'
  
    
  
  end
  
  field :created_at, :type => DateTime, :default => DateTime.new
  field :updated_at, :type => DateTime, :default => DateTime.new
  
    def photo
      ;
    end
  
  
  def self.create_if_nil user
    
    # first check that nouser does not exist
    no_user = NoUser.where( :email => user[:email] ).first
    if no_user.blank?
      # can create
      no_user = NoUser.new
      no_user.email = user[:email]
      no_user.group_id = 3
      no_user.save
    end
      
    return no_user
  end
    
  def username
    self.email.split('@')[0]
  end
  
  def self.from_user user
    self.create_if_nil user
  end
    
end