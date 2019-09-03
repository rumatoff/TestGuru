module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "#{ApplicationHelper::FORM_TITLE[:edit]} #{@question.test.title} Question"
    else
      "#{ApplicationHelper::FORM_TITLE[:new]} #{@question.test.title} Question"
    end
  end
end
