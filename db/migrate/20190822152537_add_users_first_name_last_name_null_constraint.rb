class AddUsersFirstNameLastNameNullConstraint < ActiveRecord::Migration[6.0]
  def up
    change_column_null(:users, :first_name, false)
    change_column_null(:users, :last_name, false)
  end

  def down
    change_column_null(:users, :first_name, true)
    change_column_null(:users, :last_name, true)
  end
end
