class PagesController < ApplicationController

  def main
    @user = current_user
    @standings = User.standings
  end

  def admin
  end

  def failure
    redirect_to root_path, :notice => "Oops, looks like you denied. To access the game, you need to authorize access with Twitter."
  end

end