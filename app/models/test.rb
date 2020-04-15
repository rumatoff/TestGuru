class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :nullify
  has_many :users, through: :test_passages

  scope :by_category, lambda { |title|
    joins(:category).where(categories: { title: title })
  }
  scope :by_level, ->(level) { where(level: level) }
  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :pro, -> { where(level: 5..Float::INFINITY) }
  scope :for_guru, -> { joins(:questions).group('tests.id') }

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :timer, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.pretty_by_category(title)
    by_category(title).pluck(:title)
  end

  def self.all_by_category(category_name)
    by_category(category_name)
  end

  def self.all_by_level(level)
    by_level(level.to_i)
  end
end
