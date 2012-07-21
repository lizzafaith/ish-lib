
#
# for relational models
#
module Mixin::Search
	
  def search
    key = params[:search_keywords]
    model = controller_name.classify.constantize
    
    begin
    @items = model.find(:all, 
      :conditions => ['user_id = ? and name like ?', current_user[:id], '%'+key+'%']
    )
    rescue
    end
    
    @cities = City.list
    begin
		@tags = Tag.find(:all,
			:select => [:name, :id],
			:conditions => { :is_trash => 0, :user_id => current_user[:id] },
			:order => 'name desc'
		)
    rescue
    end
    @venue_types = VenueType.list
    begin
      @cities_users = CitiesUser.list_mine current_user[:id]
    rescue
    end
    
    if @items.length == 0
      instance_variable_set('@'+controller_name.classify.downcase, model.new({:name => key}))
      render :action => 'new'
    elsif @items.length == 1
      instance_variable_set('@'+controller_name.classify.downcase, @items[0])
      render :action => 'edit'
    else
      render :action => 'index'
    end
  end
  
end