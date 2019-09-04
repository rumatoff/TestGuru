module CategoriesHelper
  def category_header(category)
    if category.persisted?
      "Edit #{category.title} Category"
    else
      'Create New Category'
    end
  end
end
