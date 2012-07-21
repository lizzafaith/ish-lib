

module AdminHelper
  
  def admin_dashboard_path
    '/admin'
  end
  
  def admin_cities_path c = {}
    return "/admin/cities/#{c.to_param}" unless c.blank?
    
    "/admin/cities"
  end
  
end