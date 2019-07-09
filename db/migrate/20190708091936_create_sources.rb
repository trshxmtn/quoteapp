class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.text :name
      t.references :rhetoric, foreign_key: true

      t.timestamps
    end
  end
end
