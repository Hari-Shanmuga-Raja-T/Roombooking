class RemovePasswordFromHotels < ActiveRecord::Migration[6.1]
  def change
    remove_column :hotels, :password, :string
  end
end
