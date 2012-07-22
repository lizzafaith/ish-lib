
module ApplicationHelper
  
  def home_path
    "/"
  end
  
  
  
  # serve ads?
  def adserv
    return true
    
    if Rails.env.production?
      if current_user && current_user[:id] == 1
        ;
      end
    end

  end
  
  def set_layout_path
    "/set-layout"
  end
  
  # localization shorthands
  def g a
    t('g.' + a)
  end
  
  def language_path l
    "/languages/#{l.to_param}"
  end
  
  def subscription_path s
    "/subscriptions/#{s.to_param}"
  end

  def pretty_date input
    return '0000-00-00' if input.blank?
    input.strftime("%Y-%m-%d")
  end
  
  def oauth_redirect_url
    'http://tunnel1.sf.akqa.com:8810/oauth/redirect'
  end
  
  def tag_homepage_path
    '/tags/homepage'
  end
  
  def my_index_tags_link
    return link_to 'My Tags', '/my/tags'
  end
  
  def set_profile_photo_link photo
		button_to 'Set Profile Photo', :controller => :photos, :id => photo.id, :action => :set_profile_photo
	end
  
  def venues_in_city_path city
    return '/cities/' + city.to_param + '/venues'
  end
  
  def user_galleries_path user
    return '/user/' + user[:id].to_s + '/galleries'
  end
 
  def user_reports_path user
    return '/user/' + user[:id].to_s + '/reports'
  end
  
  def join_community_button community
    button_to 'Join Community', '/communities/' + community.id.to_s + '/join'
  end
  
  def venue_type_path v
    '/venue_types/' + v.to_param
  end
  
 
  
  def privacy_policy_path
    "/privacy-policy"
  end
  
end
