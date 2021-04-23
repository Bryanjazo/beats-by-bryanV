class SessionsController < ApplicationController


  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    signin_and_redirect @user
    byebug
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
