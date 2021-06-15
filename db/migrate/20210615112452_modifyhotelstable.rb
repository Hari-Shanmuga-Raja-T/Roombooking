class Modifyhotelstable < ActiveRecord::Migration[6.1]
  def change
    change_column :hotels,:email,:string,:null=>false
  end
end
