module AnswersHelper
  def answer_header(answer)
    if answer.persisted?
      "Edit #{answer.question.body} Answer"
    else
      "Create New #{@answer.question.body} Answer"
    end
  end
end
