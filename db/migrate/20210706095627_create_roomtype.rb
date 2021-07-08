class CreateRoomtype < ActiveRecord::Migration[6.1]
  def change
    create_table :roomtypes do |t|
      t.string :room_id
      t.boolean :AC
      t.integer :beds

      t.timestamps
    end
  end
end
