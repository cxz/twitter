class UsersController < ApplicationController

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  def show
    @user = User.find(params[:id])
    @standings = User.standings

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

end