class AddAuthorIdToTests < ActiveRecord::Migration[6.0]
  def change
    # add_column :tests, :author_id, :integer, foreign_key: true
    add_reference :tests, :author, foreign_key: { to_table: :users }
  end
end
