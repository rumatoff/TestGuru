class Test < ApplicationRecord
  def self.by_category(title)
    join = 'INNER JOIN categories ON categories.id = category_id'
    joins(join).where(categories: { title: title }).order(id: :desc).pluck(:title)
  end
end
