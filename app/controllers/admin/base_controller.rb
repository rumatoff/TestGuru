class Admin::BaseController < Admin::BaseController

  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: 'Your are not authorized to view this page' unless current_user.is_a?(Admin)
  end
end
