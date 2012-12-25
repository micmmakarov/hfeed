class HomeController < ApplicationController
  def index
  end

  def callback

      if params[:code]
        session[:access_token] = session[:oauth].get_access_token(params[:code])
      end

      begin
        @api = Koala::Facebook::API.new(session[:access_token])
        fb_me = @api.get_object("me")

        if user_signed_in?
          current_user.facebook = fb_me["id"]
          current_user.facebook_token = session[:access_token]
          current_user.save!
        else
          user = User.where(:facebook => fb_me["id"])
          if user.blank?
            user = User.new
            user.password = user.password_confirmation = Devise.friendly_token.first(10)
            user.name = fb_me["name"]
            user.email = fb_me["email"]
            user.facebook = + fb_me["id"]
            user.facebook_token = session[:access_token]
            user.save!
          end
          binding.pry
          sign_in(user)
        end

      rescue Exception=>ex
        puts ex.message
      end

    redirect_to :action => :index
  end

end
