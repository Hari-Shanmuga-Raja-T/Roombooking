class AddIndexToRooms < ActiveRecord::Migration[6.1]
  def change
    add_index :rooms, :hotelid
  end
end
