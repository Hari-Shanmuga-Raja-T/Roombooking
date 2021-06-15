class CreateHotels < ActiveRecord::Migration[6.1]
  def change
    create_table :hotels do |t|
      t.string :hotelid
      t.string :hotelname
      t.string :password
      t.string :room
      t.string :email
      t.string :phno
      t.string :address

      t.timestamps
    end
  end
end
