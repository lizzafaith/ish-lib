

class AdminController < ApplicationController
  
  before_filter :admin_required
  
  def admin_required
    authenticate_or_request_with_http_basic do |username, password|
      username == "piousbox" && password == "password1234"
    end
  end

end