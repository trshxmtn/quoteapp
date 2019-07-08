class RemoveColumnFromRhetorics < ActiveRecord::Migration[5.2]
  def change
    remove_column :rhetorics, :titile, :string
  end
end
