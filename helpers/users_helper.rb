
require 'digest/sha1'




module UsersHelper
  
  def set_username_path
    "/users/set-username"    
  end
  
  
  def facebook_login
    
    path_2 = no_user_omniauth_authorize_path(:facebook)
    return link_to image_fb, path_2, :class => :fb
    
  end
  
  def recent_activity_path user
    '/users/show/' + user[:username] + '/recent_activity'
  end
  
  def show_user_path user
    return '/users/show/' + user[:username] unless user[:username].blank?
    '/users/' + user[:id].to_s
  end
  
  def set_city_path
    '/users/set-city'
  end
  
  def new_profile_photo_path
    '/photos/new?new_profile_photo=1'
  end
  
  def dashboard_path
    '/users/dashboard'
  end
  
  def user_path user
    if !user[:username].blank?
      return '/users/show/' + user[:username]
    else
      return '/users/' + user[:id].to_s
    end
  end
  
  def edit_user_path user
    '/users/' + user.to_param + '/edit'
  end
  
  def user_contact_path user
    '/users/' + user[:username] + '/contact'
  end
  
  def sign_in_path
    '/users/sign_in'
  end
  
  def sign_out_path
    '/users/sign_out'
  end
  
  def user_reports_path u
    "/users/show/#{u.username}/reports"
  end
  
  def user_galleries_path u
    "/users/show/#{u.username}/galleries"
  end
  
  def user_videos_path u
    "/users/show/#{u.username}/videos"
  end
  
  def user_add_path u
    "/users/add/#{u[:id].to_s}"
  end
  
  #
  # no_users
  #
  
  def no_user_path u
    "/people/show/#{u.username}"
  end
  
  def no_user_sign_out_button u
    button_to t('users.sign_out'), sign_out_path, :method => :delete
  end
  
  def user_omniauth_authorize_path *args
    no_user_omniauth_authorize_path args
  end
  
end
