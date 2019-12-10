class DropFeedback < ActiveRecord::Migration[6.0]
  def change
    drop_table :feedback
  end
end
