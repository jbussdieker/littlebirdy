class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.integer :command_type_id
      t.integer :script_id
      t.integer :target_script_id
      t.integer :mailbox_id
      t.integer :digits
      t.integer :position
      t.string  :value

      t.timestamps
    end
  end
end
