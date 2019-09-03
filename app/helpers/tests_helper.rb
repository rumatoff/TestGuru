# frozen_string_literal: true

module TestsHelper
  def test_header(test)
    if test.persisted?
      "#{ApplicationHelper::FORM_TITLE[:edit]} #{test.title} Test"
    else
      "#{ApplicationHelper::FORM_TITLE[:new]} #{test.title} Test"
    end
  end

  def number_of_questions(test)
    test.questions.count
  end
end
