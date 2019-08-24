class Test < ApplicationRecord

  has_many :questions
  has_many :results
  has_many :users, through: :results
  belongs_to :category
  has_one :author, foreign_key: 'id', class_name: 'User'

  scope :by_category, lambda { |title|
    joins(:category).where(categories: { title: title })
                    .order(id: :desc).pluck(:title)
  }
end
