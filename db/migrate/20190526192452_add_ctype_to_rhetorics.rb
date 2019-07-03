class AddCtypeToRhetorics < ActiveRecord::Migration[5.2]
  def change
    add_column :rhetorics, :ctype, :string
  end
end
