class Users::SessionsController < Devise::SessionsController
  after_action :welcome_message, only: :create

  private

  def welcome_message
    flash[:notice] = "Hi, #{current_user.first_name}"
  end

  def after_sign_in_path_for(current_user)
    if current_user.is_a?(Admin)
      admin_tests_path
    else
      tests_path
    end
  end
end
