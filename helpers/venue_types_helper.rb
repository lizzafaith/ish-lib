

module VenueTypesHelper
  
  def venue_type_in_city_path(type, city)
    "/venues/#{type[:name_seo]}/in/#{city.name_seo}"
  end
end