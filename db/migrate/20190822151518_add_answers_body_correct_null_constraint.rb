class AddAnswersBodyCorrectNullConstraint < ActiveRecord::Migration[6.0]
  def up
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :correct, false)
    change_column_null(:answers, :question_id, false)
  end

  def down
    change_column_null(:answers, :body, true)
    change_column_null(:answers, :correct, true)
    change_column_null(:answers, :question_id, true)
  end
end
