class Test < ApplicationRecord

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results
  belongs_to :category
  belongs_to :author, class_name: 'User'

  scope :by_category, lambda { |title|
    joins(:category).where(categories: { title: title })
                    .order(id: :desc).pluck(:title)
  }
end
