class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_first_question, on: :create
  before_update :next_question, unless: :completed?

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
    self.test.questions.index(current_question) + 1
  end

  def question_count
    self.test.questions.count
  end

  private

  def set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    if answer_ids.nil?
      false
    else
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    end
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
