class AddAnswersCorrectDefaultValue < ActiveRecord::Migration[6.0]
  def up
    change_column_default(:answers, :correct, from: nil, to: false)
  end

  def down
    change_column_default(:answers, :correct, from: false, to: nil)
  end
end
