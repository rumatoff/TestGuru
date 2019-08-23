class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body
      t.boolean :correct
      t.references :question, foreign_key: { to_table: :questions }, index: true

      t.timestamps
    end
  end
end
