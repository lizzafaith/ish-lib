

class NoModel2
  
  include Mongoid::Document
  
  field :name, :type => String
  
  field :seo, :type => String
  validates :seo, :uniqueness => true
  
  field :descr, :type => String
  
  field :tags, :type => Array
  
  field :created_at, :type => DateTime, :default => Time.now
  field :updated_at, :type => DateTime, :default => Time.now
  
  field :is_public, :type => Boolean, :default => 1
  field :is_feature, :type => Boolean, :default => 0
  field :is_trash, :type => Boolean, :default => 0
  
  # earth coords
  field :x, :type => Float
  field :y, :type => Float
  
  def id
    self[:_id]
  end
  
  def self.public
    self.where( :is_public => 1, :is_trash => 0 )
  end
  
  def self.feature
    self.where( :is_feature => 1 )
  end
  
end