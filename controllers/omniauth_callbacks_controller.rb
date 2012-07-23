

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def facebook
    
    email = request.env["omniauth.auth"]['info']['email']
    session["devise.facebook_data"] = request.env['omniauth.auth']
    
    @user = NoUser.create_if_nil :email => email
    sign_in @user
    
    redirect_to '/'
    
  end
  
end