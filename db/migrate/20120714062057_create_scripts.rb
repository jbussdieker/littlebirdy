class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string :name
      t.integer :user_id
      t.boolean :has_input
      t.integer :input_size

      t.timestamps
    end
  end
end
