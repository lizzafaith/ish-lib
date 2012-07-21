

module CountriesHelper
  
  def countries_path
    '/countries'
  end
  
  def country_path c
    return "countries/visit/#{c[:name_seo]}" unless c[:name_seo].blank?
    
    "/countries/#{c.to_param}"
  end
  
end