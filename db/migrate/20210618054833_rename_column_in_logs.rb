class RenameColumnInLogs < ActiveRecord::Migration[6.1]
  def change
    rename_column :logs, :hotelid, :hotel_id
    rename_column :logs, :userid, :user_id
  end
end
