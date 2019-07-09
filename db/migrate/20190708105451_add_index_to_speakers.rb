class AddIndexToSpeakers < ActiveRecord::Migration[5.2]
  def change
    remove_index :speakers, :name
    add_reference :speakers, :rhetoric, foreign_key: true
  end
end
