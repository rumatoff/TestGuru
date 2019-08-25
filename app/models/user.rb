class User < ApplicationRecord

  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :my_tests, foreign_key: 'author_id', class_name: 'Test'

  def tests_by_level(level)
    my_tests.where(tests: { level: level })
  end
end
