

module VideosHelper
  
  def image_video_thumb v
    image_tag "http://img.youtube.com/vi/" + v[:youtube_url] + "/1.jpg"
  end
  
  def videos_path v = {}
    return '/vides/' + v.to_param unless v.blank?
    
    '/videos'
  end
  
  def show_video_path v
    return '/videos/show/' + v[:name_seo] unless v[:name_seo].blank?
    return '/videos/show/' + v[:seo] unless v[:seo].blank?
    
    '/videos/' + v.to_param
  end
  
  def video_path v
    show_video_path v
  end
  
  def no_videos_path *args
    videos_path *args
  end
  
end