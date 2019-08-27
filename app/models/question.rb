class Question < ApplicationRecord

  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_answers_count

  private

  def validate_answers_count
    errors.add(:answers, 'количество от 1 до 4') unless answers.size == (1..4)
  end
end
