

module ImagesHelper
  
  def button_fb_login
    link_to image_tag('http://s3.amazonaws.com/ish-assets/loginWithFacebook.png'), user_omniauth_authorize_path(:facebook), :class => :fb
  end
  
  def image_expand_down
    image_tag 'drag.png'
  end
  
  def image_expand_up
    image_tag 'drag.png'
  end
  
  def image_ppf
    image_tag 'ppf.gif'
  end
  
  def image_ish
    # image_tag 'logo.png'
    image_tag 'ish_logo_100.png'
  end
  
  def image_top
    image_tag('top.gif')
  end
  
  def image_close
    image_tag('close.png')
  end
  
  def image_edit
    image_tag('edit.png')
  end
  
  def image_email
    image_tag 'email.gif'
  end
  
  def image_add
    image_tag 'new.png'
  end
  
  def image_search
    image_tag('search.png')
  end
  
  def image_cac
    s3_image_tag 'cac.png'
  end
  
  def image_delete
    image_tag 'delete.png'
  end
  
  def image_new
		image_tag 'new.png'
	end
  
  # @deprecated, should use image_3s
  def s3_image_tag input
    image_tag 'https://s3.amazonaws.com/ish-assets/' + input
  end
  
  def image_fb
    image_tag 'http://s3.amazonaws.com/ish-assets/loginWithFacebook.png'
  end
  
  def image_3s input
    image_tag 'https://s3.amazonaws.com/ish-assets/' + input
  end
  
  # @TODO:
  def video_thumb video
    warn 'todo wtf?'
    image_tag 'no_image.png'
  end
  
  #
  # missing stuff
  #
  
  def image_or_missing photo, size = :thumb
    
    if defined? photo.photo
      if defined? photo.photo.url
        if photo.photo.url == '/photos/original/missing.png'
          ;
        else
          return image_tag photo.photo.url(size)
        end
      end
    end
    
    image_missing
  end
  
  def image_missing
    image_tag 'no_photo.png'
  end
  
  def missing
    image_missing
  end
  
  def missing? item
    if defined? item.photo and defined? item.photo.url
      if item.photo.url == "/photos/original/missing.png"
        return true
      else
        return false
      end
    end
    
    return true
  end
  
end