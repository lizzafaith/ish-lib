
module My::DaysHelper
  
  def my_days_path d = {}
    return "/my/days/#{d.to_param}" unless d.blank?
    
    "/my/days"
  end
  
  def my_new_day_path
    '/my/days/new'
  end
  
  def my_day_path d = {}
    "/my/days/#{d.to_param}"
  end
  
  def my_days_search_path
    "/my/days/search"
  end
  
end