class Users::SessionsController < Devise::SessionsController

  def create
    super
    flash[:notice] = "Hi, #{current_user.first_name}"
  end
end
