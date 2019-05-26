class AddUserIdToRhetorics < ActiveRecord::Migration[5.2]
  def change
    add_column :rhetorics, :user_id, :integer
    add_index :rhetorics, :user_id
  end
end
