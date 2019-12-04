class CreateFeedback < ActiveRecord::Migration[6.0]
  def change
    create_table :feedback do |t|
      t.text :name
      t.text :email
      t.text :message

      t.timestamps
    end
  end
end
