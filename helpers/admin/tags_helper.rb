
module Admin::TagsHelper
  

  def admin_edit_tag_path tag
    '/admin/tags/' + tag.id.to_s + '/edit'
  end

end