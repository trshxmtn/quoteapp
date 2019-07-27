class AddSpeakerToRhetorics < ActiveRecord::Migration[5.2]
  def change
    add_column :rhetorics, :speaker, :text
  end
end
