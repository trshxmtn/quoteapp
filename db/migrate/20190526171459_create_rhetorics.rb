class CreateRhetorics < ActiveRecord::Migration[5.2]
  def change
    create_table :rhetorics do |t|
      t.string :title
      t.text :meigen
      t.text :description

      t.timestamps
    end
  end
end
