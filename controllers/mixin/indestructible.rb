
#
# for sql models
#
module Mixin::Indestructible
  
  def destroy args = {}
    model = controller_name.classify.constantize
    @item = model.find(params[:id])
    @item[:is_trash] = 1
    respond_to do |format|
      if @item.save!
        format.html { redirect_to(args[:redirect_to] || dashboard_path) }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @item.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def publicize
    model = controller_name.classify.constantize
    @item = model.find(params[:id])
    @item[:is_public] = 1
    respond_to do |format|
      if @item.save!
        format.html { redirect_to(request.referer || dashboard_path) }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @item.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def unpublicize
    model = controller_name.classify.constantize
    @item = model.find(params[:id])
    @item[:is_public] = 0
    respond_to do |format|
      if @item.save!
        format.html { redirect_to(request.referer || dashboard_path) }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @item.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end