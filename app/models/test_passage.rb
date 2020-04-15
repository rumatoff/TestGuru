class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  scope :attempts, ->(user_id, test_id) { where(user_id: user_id, test_id: test_id, successfully: true) }

  def self.all_success_attempts(user_id, test_id)
    attempts(user_id, test_id)
  end

  def self.after(created_at)
    where('created_at > ?', created_at)
  end

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
    self.successfully = true if passed?
    save!
  end

  def question_number
    test.questions.where('id <= ?', current_question.id).count
  end

  def question_count
    test.questions.count
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
end
