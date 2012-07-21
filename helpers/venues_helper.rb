
module VenuesHelper
  
  def venue_path v
    return '/venues/show/' + v[:name_seo] unless v[:name_seo].blank?
    
    return '/venues/' + v[:id].to_s unless v[:id].blank?
    
    return "/venues"
  end
  
  def admin_new_venue_path
    '/admin/venues/new'
  end
  
  def venue_events_path v
    begin
    '/venues/show/' + v[:name_seo] + '/events'
    rescue
      flash[:notice] = t('e.venues.no_events')
      venue_path v
    end
  end
 
end