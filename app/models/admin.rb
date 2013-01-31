class Admin < ActiveRecord::Base
  attr_accessible :nickname

  after_create :upgrade_existing_admin

  def remove
    user = User.where(:nickname => self.nickname).first
    user.update_attributes!(:admin => false) if user
    destroy
  end

  private

  def upgrade_existing_admin
    user = User.where(:nickname => self.nickname).first
    user.update_attributes!(:admin => true) if user
  end

end
