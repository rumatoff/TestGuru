# frozen_string_literal: true

module TestsHelper
  def test_header(test)
    if test.persisted?
      "Edit #{test.title} Test"
    else
      'Create New Test'
    end
  end

  def number_of_questions(test)
    test.questions.count
  end
end
