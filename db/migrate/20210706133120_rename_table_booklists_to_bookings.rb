class RenameTableBooklistsToBookings < ActiveRecord::Migration[6.1]
  def change
    rename_table :booklists,:bookings
  end
end
