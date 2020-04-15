class AddConditionToBadges < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :condition, :string, null: true
  end
end
