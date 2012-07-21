
#
# for relational models
#
module Mixin::MarkFeatures
  
  def mark_features
    
    obj = find_obj
    authorize! :mark_features, obj.new
    
    

    if params[:id] && params[:is_feature]
      # post
      
      obj = find_obj
    
      item = obj.find(params[:id])
      item[:is_feature] = params[:is_feature]
      
      t = item.save
      
      if t
        @result = item[:is_feature] ? 'true' : 'false'
        render 'result', :layout => false
      else
        #
        # freakout
        #
        flash[:error] = item.errors
        @result = item[:is_feature] ? 'false' : 'true'
        render 'result', :layout => false
      end
      
    else
      # get
      limit = 10
      limit = obj.per_page rescue
      limit = obj.per_features_page rescue
    
      include = [ :user ]
    
    
      @items = obj.paginate(:page => params[:page],
        :conditions => { :is_public => 1, :is_trash => 0 },
        :limit => limit,
        :include => include,
        :order => 'created_at desc'
      )
    
    end
    
  end
  
  private
  
  def find_obj
    @ctrl = self.class.name.sub("Controller", "").split('::')[1]
    model_name = @ctrl.singularize
    
    @ctrl.downcase!
    return Object::const_get(model_name)
    
  end
  
end