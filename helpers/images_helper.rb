

module ImagesHelper
  
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
  
  # @deprecated use image_edit
  def edit_image
    image_edit
  end
  
  # @deprecated use image_delete
  def delete_image
    image_delete
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
    image_tag 'no_image.png'
  end
  
  def image_or_missing photo, size = :thumb
    if defined? photo.photo
      if defined? photo.photo.url
        image_tag photo.photo.url size
      end
    else
      missing
    end
  end
  
  def image_missing
    image_tag 'no_photo.png'
  end
  
  def missing
    image_tag('no_photo.png')
  end
  
  def missing? item
    if defined? item.photo and defined? item.photo.url
      if item.photo.url == "/photos/original/missing.png"
        return true
      else
        return false
      end
    else
      return true
    end
  end
  
  def button_fb_login
    link_to image_tag('http://s3.amazonaws.com/ish-assets/loginWithFacebook.png'), user_omniauth_authorize_path(:facebook), :class => :fb
  end
  
  def image_ish
    # @todo: move to s3
    image_tag 'logo.png'
  end
  
end