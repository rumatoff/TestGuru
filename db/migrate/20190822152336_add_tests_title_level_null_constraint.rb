class AddTestsTitleLevelNullConstraint < ActiveRecord::Migration[6.0]
  def up
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
    change_column_null(:tests, :category_id, false)
  end

  def down
    change_column_null(:tests, :title, true)
    change_column_null(:tests, :level, true)
    change_column_null(:tests, :category_id, true)
  end
end
