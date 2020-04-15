class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, unique: true
      t.string :badge_img, default: '/img/badge_default.png'

      t.timestamps
    end
  end
end
