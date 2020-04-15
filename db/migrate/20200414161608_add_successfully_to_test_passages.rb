class AddSuccessfullyToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :successfully, :boolean
  end
end
