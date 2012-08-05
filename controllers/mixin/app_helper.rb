

#
# for application helper, it grew too large
#
module Mixin::AppHelper
  
  
  
  
  def set_action_name
    begin
      @action_name = params[:controller].gsub('/', '_') + '_' + params[:action]
    rescue
    end
    
    begin
      @action_classes = params[:controller].gsub('/', '_')
    rescue
    end
    
  end
  
  def puts_each! args
    puts '+++ +++'
    if args.blank?
      puts nil
    else
      args.each do |a|
        puts a
      end
    end
  end
  
  def puts! arg
    puts '+++ +++'
    puts arg.inspect
  end
  
  
  def log type
    obj = Error.create :referred => request.referrer, :url => request.url, :type => type
  end
  
  def check_mobile
    if mobile_device?
      session[:layout] = 'mobile'
    end
  end
  
  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
 
  def set_locale
    # I18n.locale = params[:locale] || I18n.default_locale
    I18n.locale = extract_locale_from_subdomain || I18n.default_locale
  end
  
  # Get locale from top-level domain or return nil if such locale is not available
  # You have to put something like:
  #   127.0.0.1 application.com
  #   127.0.0.1 application.it
  #   127.0.0.1 application.pl
  # in your /etc/hosts file to try this out locally
  def extract_locale_from_tld
    
    parsed_locale = request.host.split('.').last
    I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale  : nil
  end
  
  # Get locale code from request subdomain (like http://it.application.local:3000)
  # You have to put something like:
  #   127.0.0.1 gr.application.local
  # in your /etc/hosts file to try this out locally
  def extract_locale_from_subdomain
    @parsed_locale = request.subdomains.first
    if @parsed_locale.blank?
      @parsed_locale = 'en'
    end
    I18n.available_locales.include?(@parsed_locale.to_sym) ? @parsed_locale : 'en'
  end
  
  
  def set_layout
    
    unless params[:set_layout].blank?
      session[:layout] = params[:set_layout] 
    end
    
    return session[:layout] unless session[:layout].blank?
    
    return current_user[:layout] unless current_user.blank? || current_user[:layout].blank?

    'application'
  end
  
  def render_optional_error_file(status_code)
    known_codes = ["404", "422", "500"]
    status = interpret_status(status_code)

    if known_codes.include?(status_code)
      render_404
    else
      render_unknown
    end
  end
  
  def set_lists
    @cities_fr4re = [
      ['San Francisco', 22],
      ['Moscow', 3]
    ]
    
    @layouts_list = [ 'application', 'minimal' ]
  end
  
end