class AddPictureToRhetorics < ActiveRecord::Migration[5.2]
  def change
    add_column :rhetorics, :picture, :text
  end
end
