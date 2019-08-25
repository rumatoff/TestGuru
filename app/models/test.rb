class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  scope :by_category, lambda { |title|
    joins(:category).where(categories: { title: title })
                    .order(id: :desc)
  }
  def self.pretty_by_category(title)
    by_category(title).pluck(:title)
  end
end
