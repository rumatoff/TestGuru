class DropUsersBages < ActiveRecord::Migration[6.0]
  def change
    drop_table :badges_users
  end
end
