

class NoTag
  
  include Mongoid::Document
  
  field :name, :type => String
  field :seo, :type => String
  
  field :descr, :type => String
  
  field :id, :type => Integer
  field :user_id, :type => Integer
  
  field :created_at, :type => DateTime
  field :updated_at, :type => DateTime
  
  field :is_public, :type => Boolean
  field :is_feature, :type => Boolean
  field :is_trash, :type => Boolean
  
  
#  referenced_in :video
#  referenced_in :no_user

  embeds_many :no_tags
  
end
