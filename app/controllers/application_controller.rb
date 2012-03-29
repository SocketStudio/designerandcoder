class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user

  before_filter :signed_in?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
  	unless current_user
  		redirect_to sign_in_url
  	end
  end

  
end
