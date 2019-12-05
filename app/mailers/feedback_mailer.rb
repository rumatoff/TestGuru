class FeedbackMailer < ApplicationMailer
  default from: 'rumatoff@gmail.com'

  def feedback_email
    @feedback = params[:feedback]
    mail(to: 'rumatoff@gmail.com', subject: 'From feedback form')
  end
end
