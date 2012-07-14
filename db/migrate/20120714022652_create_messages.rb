class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :url
      t.boolean :new
      t.integer :mailbox_id

      t.timestamps
    end
  end
end
