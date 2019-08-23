class Test < ApplicationRecord
  def self.by_category(title)
    where(category_id: Category.find_by_title(title).id).order(id: :desc)
                                                        .pluck(:title)
  end
end
