

class NoModel
  include Mongoid::Document
  
  field :name, :type => String
  field :name_seo, :type => String
  
  field :descr, :type => String
  
  field :user_id, :type => Integer
  
  field :created_at, :type => DateTime, :default => Time.now
  field :modified_at, :type => DateTime
  
  field :is_trash, :type => Boolean
  field :is_public, :type => Boolean
  field :is_feature, :type => Boolean
end