class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    nickname = auth[:info][:nickname]
    image = auth[:info][:image]
    admin = Admin.where(:nickname => nickname).exists?
    user.update_attributes!(:nickname => nickname, :image => image, :admin => admin)
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Welcome #{current_user.name}, you're signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

end
