module CategoriesHelper
  def category_header(category)
    if category.persisted?
      "#{ApplicationHelper::FORM_TITLE[:edit]} #{category.title} Category"
    else
      "#{ApplicationHelper::FORM_TITLE[:new]} #{category.title} Category"
    end
  end
end
