class FeedbackController < ApplicationController
  respond_to :html

  skip_before_action :authenticate_user!

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbackMailer.with(feedback: @feedback).feedback_email.deliver_now
      redirect_to new_feedback_path, notice: 'Форма успешно отправленна'
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :message)
  end
end
