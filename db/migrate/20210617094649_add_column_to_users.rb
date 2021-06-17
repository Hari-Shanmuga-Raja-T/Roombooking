class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :phno, :string
    add_column :users, :address, :string
  end
end
