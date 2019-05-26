class AddImageToRhetorics < ActiveRecord::Migration[5.2]
  def change
    add_column :rhetorics, :image, :binary
  end
end
