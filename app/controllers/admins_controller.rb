class AdminsController < ApplicationController

  before_filter :admin_only

  def index
    @admins = Admin.order(:id).all
    @new_admin = Admin.new
  end

  def create
    Admin.create(params[:admin])
    redirect_to admins_path
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.remove
    redirect_to admins_path
  end


end