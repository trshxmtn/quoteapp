class CreatePicks < ActiveRecord::Migration[5.2]
  def change
    create_table :picks do |t|
      t.integer :user_id
      t.integer :rhetoric_id

      t.timestamps

      t.index :user_id
      t.index :rhetoric_id
      t.index [:user_id, :rhetoric_id], unique: true
    end
  end
end
