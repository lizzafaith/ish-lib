



module Admin::UsersHelper
  
  def admin_index_public_tags_link
    return link_to 'Public Tags', '/admin/tags', :class => 'admin_index_public_tags'
  end
  
  def admin_edit_user_path user
    '/admin/users/' + user.to_param + '/edit'
  end
  
  def admin_new_tag_path
    '/admin/tags/new'
  end
  
  def my_tags_path
    '/my/tags'
  end
  
  def admin_subscriptions_path
    '/admin/subscriptions'
  end
  
  def admin_ratings_path
    '/admin/ratings'
  end
  
  def admin_reports_path
    '/admin/reports'
  end
end


