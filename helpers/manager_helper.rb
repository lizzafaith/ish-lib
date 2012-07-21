

module ManagerHelper
  
  def manager_dashboard_path
    '/manager'
  end
  
  def manager_mark_features_path
    '/manager/reports/mark_features'
  end
  
  #  def manager_tags_path
  #    "/manager/tags"
  #  end
  #
  #  def manager_tag_path tag
  #    "/manager/tags/#{tag[:id].to_s}"
  #  end
  #  def manager_edit_venue_path v
  #    '/manager/venues/' + v.to_param + '/edit'
  #  end
  #  
  #  def manager_venue_path v
  #    '/manager/' + v.to_param
  #  end
  #  
  #  def manager_new_tag_path
  #    '/manager/tags/new'
  #  end
  #  
  #  def manager_new_venue_path
  #    '/manager/venues/new'
  #  end
  #  
  #  def manager_new_venue_type_path
  #    '/manager/venue_types/new'
  #  end
  #  
  #  def manager_venues_path venue = {}
  #    return '/manager/venues' if venue.blank?
  #    
  #    '/manager/venues/' + venue[:id].to_s
  #  end
  #  
  #  def manager_edit_venue_type_path v
  #    "/manager/venue_types/#{v.to_param}/edit"
  #  end
  #  
  #  def manager_cities_path
  #    "/manager/cities"
  #  end
  #  
  #  def manager_edit_tag_path tag
  #    '/manager/tags/' + tag.to_param + '/edit'
  #  end
  
end