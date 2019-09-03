module QuestionsHelper
  FORM_TITLE = { new: 'Create New', edit: 'Edit' }.freeze

  def question_header
    "#{FORM_TITLE[action_name.to_sym]} #{@test.title} Question"
  end
end
