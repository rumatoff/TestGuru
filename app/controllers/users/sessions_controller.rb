class Users::SessionsController < Devise::SessionsController

  def create
    super
    flash[:notice] = t('.hello') + ", #{current_user.first_name}"
  end
end
