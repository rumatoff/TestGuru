module TestsHelper
  def test_header
    "#{ApplicationHelper::FORM_TITLE[action_name.to_sym]} Test"
  end

  def number_of_questions(test)
    test.questions.count
  end
end
