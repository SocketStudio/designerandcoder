class SessionsController < ApplicationController
  
# User lands on Sessions New.  If they area already signed in, redirect to index of users
# If they are not signed in, render new so they can sign in

skip_before_filter :signed_in?

  def new
  end

  def create
    auth = request.env["omniauth.auth"]
      if user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
        update_user(user, auth)
      else
       user = User.create_with_omniauth(auth)
      end

    session[:user_id] = user.id
    redirect_to users_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

  def update_user(user, auth)
    user.name = auth["info"]["name"]
    user.twitter_profile_image_url = auth["info"]["image"]
    user.twitter_location = auth["info"]["location"]
    user.save
  end
  
  
end
