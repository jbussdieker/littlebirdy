class CreateCallers < ActiveRecord::Migration
  def change
    create_table :callers do |t|
      t.string :name
      t.string :number
      t.integer :user_id

      t.timestamps
    end
  end
end
