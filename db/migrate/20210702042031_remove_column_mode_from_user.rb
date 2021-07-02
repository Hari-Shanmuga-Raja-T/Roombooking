class RemoveColumnModeFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :mode, :string
  end
end
