class AddTestsTitleLevelNullConstraint < ActiveRecord::Migration[6.0]
  def up
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
  end

  def down
    change_column_null(:tests, :title, true)
    change_column_null(:tests, :level, true)
  end
end
