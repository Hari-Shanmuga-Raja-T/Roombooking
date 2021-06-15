class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :roomid
      t.string :hotelid
      t.string :roomno
      t.string :status
      t.string :price
      t.string :roomtype

      t.timestamps
    end
  end
end
