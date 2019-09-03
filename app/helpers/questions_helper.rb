module QuestionsHelper
  def question_header
    "#{ApplicationHelper::FORM_TITLE[action_name.to_sym]} #{@test.title} Question"
  end
end
