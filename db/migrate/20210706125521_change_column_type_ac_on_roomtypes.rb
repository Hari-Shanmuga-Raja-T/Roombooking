class ChangeColumnTypeAcOnRoomtypes < ActiveRecord::Migration[6.1]
  def change
    change_column :roomtypes, :AC,:string
  end
end
