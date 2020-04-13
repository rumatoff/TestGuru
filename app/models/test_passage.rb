class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  def completed?
    current_question.nil?
  end

  def passed?
    result_to_percent >= 85
  end

  def result_to_percent
    correct_questions.to_f / self.test.questions.count * 100
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def question_number
    test.questions.where('id <= ?', current_question.id).count
  end

  def question_count
    test.questions.count
  end

  def time_left
    (time_to_test - Time.current).to_i
  end

  def time_is_over?
    time_left.zero?
  end

  def abort!
    self.current_question = nil
  end

  private

  def set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def time_to_test
    created_at + test.timer.minutes
  end
end
