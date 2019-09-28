class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(cookies[:intended_url] || tests_path)
      cookies.delete :intended_url
    else
      flash[:alert] = 'Are you a Guru? Verify your email and password please'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
