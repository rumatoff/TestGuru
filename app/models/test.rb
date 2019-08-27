class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :nullify
  has_many :users, through: :results

  scope :by_category, lambda { |title|
    joins(:category).where(categories: { title: title })
                    .order(id: :desc)
  }
  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :pro, -> { where(level: 5..Float::INFINITY) }

  def self.pretty_by_category(title)
    by_category(title).pluck(:title)
  end
end