class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  private

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
      redirect_to root_url
    end
  end

  def admin_only
    raise "Unauthorized" unless current_user.is_admin?
  end
end
