class AddIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :tests, %i[title level], unique: true
    add_index :test_passages, %i[user_id test_id]
  end
end
