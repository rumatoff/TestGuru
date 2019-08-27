class User < ApplicationRecord

  has_many :results, dependent: :nullify
  has_many :tests, through: :results
  has_many :my_tests, foreign_key: 'author_id', class_name: 'Test'

  validates :email, presence: true

  def tests_by_level(level)
    tests.where(tests: {level: level})
  end
end
