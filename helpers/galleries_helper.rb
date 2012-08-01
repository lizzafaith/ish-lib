module GalleriesHelper
  
  def gallery_image_path gallery, photo_id = '', opts = {}
    if opts[:set_style].blank?
      optsz = ''
    else
      optsz = "?set_style=#{opts[:set_style]}"
    end
    
    "/galleries/show/#{gallery[:name_seo]}/#{photo_id.to_s}#{optsz}"
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
  
  def venue_gallery_path
    '#'
  end
  
  def wide_image_path
    "/photos/wide/"
  end
  
  def galleries_path_2
    "/galleries/index_2"
  end
  
  def add_photos_to_path gallery
    "/photos/driver_for/#{gallery[:id]}"
  end
  
end
