class RemoveColumnRoomFromHotel < ActiveRecord::Migration[6.1]
  def change
    remove_column :hotels, :room, :string
  end
end
