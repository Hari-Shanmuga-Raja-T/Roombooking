class CreateBooklist < ActiveRecord::Migration[6.1]
  def change
    create_table :booklists do |t|
      t.string :user_id
      t.string :hotel_id
      t.string :room_id
      t.date :startdate
      t.date :enddate

      t.timestamps
    end
  end
end
