class Renamehotelid < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :hotelid, :hotel_id
  end
end
