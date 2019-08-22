class AddTestsLevelDefaultValue < ActiveRecord::Migration[6.0]
  def up
    change_column_default(:tests, :level, from: nil, to: 1)
  end

  def down
    change_column_default(:tests, :level, from: 1, to: nil)
  end
end
