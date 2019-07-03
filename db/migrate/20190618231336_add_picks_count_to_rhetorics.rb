class AddPicksCountToRhetorics < ActiveRecord::Migration[5.2]

  class MigrationUser < ApplicationRecord
    self.table_name = :rhetorics
  end

  def up
    _up
  rescue => e
    _down
    raise e
  end

  def down
    _down
  end

  private

  def _up
    MigrationUser.reset_column_information

    add_column :rhetorics, :picks_count, :integer, null: false, default: 0 unless column_exists? :rhetorics, :picks_count
  end

  def _down
    MigrationUser.reset_column_information

    remove_column :rhetorics, :picks_count if column_exists? :rhetorics, :picks_count
  end
end
