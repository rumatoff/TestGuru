class FeedbackController < ApplicationController
  def index
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      redirect_to root_path, notice: 'Форма успешно отправленна'
    else
      flash[:error] = @feedback.errors.full_messages
      render 'index'
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :message)
  end
end
