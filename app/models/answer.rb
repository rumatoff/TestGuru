class Answer < ApplicationRecord

  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_answers_count

  def validate_answers_count
    errors.add(:base, 'количество от 1 до 4') if question.answers.count > 4
  end
end
