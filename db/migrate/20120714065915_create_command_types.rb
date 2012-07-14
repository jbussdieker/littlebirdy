class CreateCommandTypes < ActiveRecord::Migration
  def change
    create_table :command_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
