class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :userid
      t.string :firstname
      t.string :lastname
      t.string :password
      t.string :email
      t.string :phno
      t.string :address

      t.timestamps
    end
  end
end
