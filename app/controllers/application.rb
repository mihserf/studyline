# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  around_filter :set_locale
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '713d9aad1b473825a11c3211ebfec190'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

  private

  def admin_required
    if session[:admin]
      return true
    else
      admin_login
    end
  end

  def admin?
    session[:admin]
  end

  def admin_login
    redirect_to admin_login_path
  end



  # Set the locale from the parameters, the session, or the navigator
  # If none of these works, the Globalite default locale is set (en-*)
  def set_locale
    # Get the current path and request method (useful in the layout for changing the language)
    @current_path = request.env['PATH_INFO']
    @request_method = request.env['REQUEST_METHOD']

    # Try to get the locale from the parameters, from the session, and then from the navigator
    if (params[:lang] && params[:lang]!="admin")
      params_locale_code = Localedb.find(:first, :select=>"code", :conditions => {:short => params[:lang]}).code
    else
      params_locale_code = 'ru-RU' unless (request.method == :post) || (request.method == :put) || (request.method == :delete)
    end


    if params_locale_code
        session[:lang] = params_locale_code
    elsif session[:lang]
        params_locale_code = session[:lang]
    else
        params_locale_code = get_valid_lang_from_accept_header
        #Localedb.global = get_valid_lang_from_accept_header
    end
    @lang=params_locale_code #@lang used in controllers and views
    Localedb.global=params_locale_code
    yield

    # reset the locale to its default value
    #Locale.reset!
  end

  # Get a sorted array of the navigator languages
  def get_sorted_langs_from_accept_header
    accept_langs = (request.env['HTTP_ACCEPT_LANGUAGE'] || "en-us,en;q=0.5").split(/,/) rescue nil
    #return nil unless accept_langs
    return "ru-RU" unless accept_langs

    # Extract langs and sort by weight
    # Example HTTP_ACCEPT_LANGUAGE: "en-au,en-gb;q=0.8,en;q=0.5,ja;q=0.3"
    wl = {}
    accept_langs.each {|accept_lang|
        if (accept_lang + ';q=1') =~ /^(.+?);q=([^;]+).*/
            wl[($2.to_f rescue -1.0)]= $1
        end
    }
    sorted_langs = wl.sort{|a,b| b[0] <=> a[0] }.map{|a| a[1] }
  end

  # Returns a valid language that best suits the HTTP_ACCEPT_LANGUAGE request header.
  # If no valid language can be deduced, then <tt>nil</tt> is returned.
  def get_valid_lang_from_accept_header
    # Get the sorted navigator languages and find the first one that matches our available languages
    get_sorted_langs_from_accept_header.detect{|l| get_matching_ui_locale(l) }
  end

  # Returns the UI locale that best matches with the parameter
  # or nil if not found
  def get_matching_ui_locale(locale)
    lang = locale[0,2].downcase
    if locale[3,5]
      country = locale[3,5].upcase
      logger.debug "[globalite] trying to match locale: #{lang}-#{country}"
      locale_code = "#{lang}-#{country}".to_sym
    else
      logger.debug "[globalite] trying to match #{lang}-*"
      locale_code = "#{lang}-*".to_sym
    end

  end




end
