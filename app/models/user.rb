class User < ApplicationRecord

  has_many :results
  has_many :tests, through: :results
  has_many :my_test, foreign_key: 'author_id', class_name: 'Test'

  def tests_by_level(level)
    Test.joins(:results).where(results: { user_id: id }, tests: { level: level })
  end
end
