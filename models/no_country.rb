
class NoCountry
  
  include Mongoid::Document
  
  field :name, :type => String
  field :seo, :type => String
  field :descr, :type => String
  field :x, :type => Float
  field :y, :type => Float
  
  embedded_in :no_city

#  validates_presence_of :name
#  validates_uniqueness_of :name
#  validates_presence_of :name_seo
#  validates_uniqueness_of :name_seo
#  validates_presence_of :x
#  validates_presence_of :y
#  validates_presence_of :descr
#  validates_length_of :descr, :minimum => 256
  
end
