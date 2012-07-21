module CommunitiesHelper
  
  def communities_path
    '/communities'
  end
  
  def community_path c
    if c.name_seo.blank?
      return '/communities/' + c.id.to_s
    else
      return '/communities/join/' + c.name_seo
    end
  end
  
  def admin_edit_community_path c
    if c.is_a? Integer
      return '/admin/communities/' + c.to_s + '/edit'
    else
      return '/admin/communities/' + c.id.to_s + '/edit'
    end
  end
  
  def community_members_path c
    return '/community/' + c.name_seo + '/members'
  end
  
  def community_events_path c
    return '/community/' + c.name_seo + '/events'
  end
  
end
