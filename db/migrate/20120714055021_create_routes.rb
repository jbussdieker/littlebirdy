class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.integer :number_id
      t.integer :caller_id
      t.integer :script_id
      t.integer :user_id

      t.timestamps
    end
  end
end
