module CitiesHelper
  
  
  def city_path city
    if city.is_a?(String)
      return '/cities/travel-to/' + city
    end
    
    if city.class.name == 'NoCity'
      "/cities/travel-to/#{city.seo}"
    end
    
    unless city.name_seo.blank?
      '/cities/travel-to/' + city.name_seo
      
    end
    
    return '/cities/' + city.id.to_s
  end
  
  def global_city_path var
    if var.is_a?(String)
      return HOST + 'cities/travel-to/' + var
    elsif var.is_a?(Integer)
      return HOST + 'cities/' + var.to_s
    elsif var.is_a?(City)
      if var[:name_seo].blank?
        return HOST + 'cities/' + var[:id].to_s
      else
        return HOST + 'cities/travel-to/' + var[:name_seo]
      end
    end
  end
  
  def city_image_tag city
    return s3_image_tag('cities-images/' + city.name_seo + '.jpg')
  end
  
  def city_events_path city
    '/events/in/' + city.name_seo
  end
  
  def city_reports_path city
    "/cities/travel-to/#{city.name_seo}/reports"
  end
  
  def city_galleries_path city
    "/cities/travel-to/#{city.name_seo}/galleries"
  end
  
  def city_communities_path city
    "/cities/travel-to/#{city.name_seo}/communities"
  end
  
  def city_users_path city
    "/cities/travel-to/#{city.name_seo}/users"
  end
  
  def city_videos_path city
    "/cities/travel-to/#{city.name_seo}/videos"
  end
  
  def city_venues_path city
    "/cities/travel-to/#{city.name_seo}/venues"
  end
  
end
