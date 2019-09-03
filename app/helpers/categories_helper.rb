module CategoriesHelper
  def category_header
    "#{ApplicationHelper::FORM_TITLE[action_name.to_sym]} Category"
  end
end
