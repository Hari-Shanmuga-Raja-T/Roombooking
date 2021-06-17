class CreateMains < ActiveRecord::Migration[6.1]
  def change
    create_table :mains do |t|
      t.string :userid
      t.string :firstname
      t.string :lastname
      t.string :phno
      t.string :address
      t.timestamps
    end
  end
end
