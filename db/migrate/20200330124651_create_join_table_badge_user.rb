class CreateJoinTableBadgeUser < ActiveRecord::Migration[6.0]
  create_join_table :badges, :users do |t|
    t.index %i[badge_id user_id]
  end
end
