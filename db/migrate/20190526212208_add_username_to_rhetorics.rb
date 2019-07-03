class AddUsernameToRhetorics < ActiveRecord::Migration[5.2]
  def change
    add_column :rhetorics, :username, :string
  end
end
