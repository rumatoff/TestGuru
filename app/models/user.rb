class User < ApplicationRecord

  has_many :test_passages, dependent: :nullify
  has_many :tests, through: :test_passages
  has_many :my_tests, foreign_key: 'author_id', class_name: 'Test'
  has_many :gists, dependent: :destroy
  has_and_belongs_to_many :badges

  validates_presence_of :first_name, :last_name

  devise :database_authenticatable,
         :registerable,
         :confirmable,
         :recoverable,
         :rememberable,
         :validatable

  def tests_by_level(level)
    tests.where(tests: { level: level })
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end
end
