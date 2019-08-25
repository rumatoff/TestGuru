class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  scope :by_category, lambda { |title|
    joins(:category).where(categories: { title: title })
                    .order(id: :desc).pluck(:title)
  }
end
