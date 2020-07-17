class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]

    identity = Identity.by_omniauth(auth)
    user = identity.user
    login_user(user)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def failure
    redirect_to root_url
  end
end
