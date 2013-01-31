class UsersController < ApplicationController

  before_filter :admin_only

  def index
    @users = User.order("id").all
  end

  def show
    @user = User.find(params[:id])
    @standings = User.standings
  end

end