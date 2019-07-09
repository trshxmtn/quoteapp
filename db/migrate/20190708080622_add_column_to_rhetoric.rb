class AddColumnToRhetoric < ActiveRecord::Migration[5.2]
  def change
    remove_column :rhetorics, :username, :string
    remove_column :rhetorics, :profile, :text
    remove_column :rhetorics, :title, :string
  end
end
