class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.string :hotelid
      t.string :userid
      t.string :roomno
      t.string :startdate
      t.string :enddate

      t.timestamps
    end
  end
end
