class AddUserFields < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    add_column :users, :number, :string
    add_column :users, :admin, :boolean
  end

  def down
    remove_column :users, :name
    remove_column :users, :number
    remove_column :users, :admin
  end
end
