class RemoveColumnFromRhetorics < ActiveRecord::Migration[5.2]
  def change
    # titileはそもそも存在しない。これはレガシーなマイグレーションファイル
    # remove_column :rhetorics, :titile, :string
  end
end
