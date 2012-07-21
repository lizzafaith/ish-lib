

module Manager::CountriesHelper
  
  def manager_edit_country_path c
    "/manager/countries/#{c.to_param}/edit" unless c.blank?
  end
  
  def manager_country_path c
    return "/manager/countries/#{c.to_param}" unless c.blank?
    
    "/manager/countries"
  end
  
  def manager_new_country_path
    return '/manager/countries/new'
  end
  
end