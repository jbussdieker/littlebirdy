class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :url
      t.boolean :new

      t.timestamps
    end
  end
end
