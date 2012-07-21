
module My::PagesHelper
  
  def my_page_path p
    "/my/pages/show/#{p.to_param}"
  end
end