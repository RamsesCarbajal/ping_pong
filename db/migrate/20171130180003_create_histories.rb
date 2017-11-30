class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :score
      t.integer :last_player

      t.timestamps null: false
    end
  end
end
