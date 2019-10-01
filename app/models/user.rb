class User < ApplicationRecord

  include Auth

  has_many :test_passages, dependent: :nullify
  has_many :tests, through: :test_passages
  has_many :my_tests, foreign_key: 'author_id', class_name: 'Test'

  def tests_by_level(level)
    tests.where(tests: { level: level })
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
