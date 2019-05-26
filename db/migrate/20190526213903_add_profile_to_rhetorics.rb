class AddProfileToRhetorics < ActiveRecord::Migration[5.2]
  def change
    add_column :rhetorics, :profile, :text
  end
end
