class ChangeColumnToInt < ActiveRecord::Migration[6.1]
  def change
    change_column :bookings, :hotel_id, 'integer USING CAST(hotel_id AS integer)'
    change_column :bookings, :user_id, 'integer USING CAST(user_id AS integer)'
    change_column :bookings, :room_id, 'integer USING CAST(room_id AS integer)'
    change_column :discounts, :hotel_id, 'integer USING CAST(hotel_id AS integer)'
    change_column :logs, :hotel_id, 'integer USING CAST(hotel_id AS integer)'
    change_column :logs, :user_id, 'integer USING CAST(user_id AS integer)'
    change_column :logs, :room_id, 'integer USING CAST(room_id AS integer)'
    change_column :rooms, :hotel_id, 'integer USING CAST(hotel_id AS integer)'
    change_column :roomtypes, :room_id, 'integer USING CAST(room_id AS integer)'
    change_column :wishlists, :user_id, 'integer USING CAST(user_id AS integer)'
    change_column :wishlists, :room_id, 'integer USING CAST(room_id AS integer)'

  end
end
