class DropRhetoricSpeakers < ActiveRecord::Migration[5.2]
  def change
    drop_table :rhetoric_speakers
  end
end
