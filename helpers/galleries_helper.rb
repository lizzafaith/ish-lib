module GalleriesHelper
  
  def gallery_image_path gallery, photo_id = ''
    "/galleries/show/#{gallery[:name_seo]}/#{photo_id.to_s}"
  end
  
  def publicize_gallery_path gallery
    '/galleries/' + gallery[:id].to_s + '/publicize'
  end
  
  def unpublicize_gallery_path gallery
    '/galleries/' + gallery[:id].to_s + '/unpublicize'
  end
  
  #  def galleries_path g = {}
  #    "/galleries/#{g.to_param}"
  #  end
  
  def show_gallery_path g
    if g[:name_seo]
      "/galleries/show/#{g[:name_seo]}/0"
    else
      "/galleries/"
    end
  end
  
  def galleries_search_path
    "/galleries/search"
  end
  
end
