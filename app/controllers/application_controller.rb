class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :facebook_auth

  def facebook_auth
    if params[:action] != 'callback'
      if session[:access_token].blank?
        session[:oauth] = Koala::Facebook::OAuth.new(FACEBOOK_APP_ID, FACEBOOK_APP_SECRET, FACEBOOK_CALLBACK)
        session[:oauth].get_user_info_from_cookies(cookies)
        @facebook_url =  session[:oauth].url_for_oauth_code(:permissions=>"read_stream, publish_stream, email")
      end
    end
  end


end
