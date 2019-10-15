class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.string :url, null: false
      t.belongs_to :question
      t.belongs_to :user

      t.timestamps
    end
  end
end
