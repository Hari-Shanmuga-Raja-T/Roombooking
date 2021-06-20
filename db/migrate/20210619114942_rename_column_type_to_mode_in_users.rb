class RenameColumnTypeToModeInUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users,:type,:mode
  end
end
