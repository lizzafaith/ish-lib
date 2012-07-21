

class NoPhoto
  
  include Mongoid::Document
  include Mongoid::Paperclip
  
  belongs_to :no_report
  belongs_to :no_venue
  belongs_to :no_user
  
  belongs_to :no_city
  
  field :url, :type => String

  has_mongoid_attached_file :photo,
    :styles => {
    :mini => '20x20#',
    :thumb=> "100x100#",
    :small  => "400x400>",
    :large => '950x950>' },
    :storage => :s3,
    :s3_credentials => S3_CREDENTIALS, # Rails.root.join('config', 's3.yml'),
  :path => "no_photos/:style/:id/:filename"
  
end
