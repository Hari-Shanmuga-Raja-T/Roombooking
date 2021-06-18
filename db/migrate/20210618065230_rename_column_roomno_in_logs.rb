class RenameColumnRoomnoInLogs < ActiveRecord::Migration[6.1]
  def change
    rename_column :logs, :roomno, :room_id
  end
end
