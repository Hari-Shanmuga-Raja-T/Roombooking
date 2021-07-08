class CreateTableWishlist < ActiveRecord::Migration[6.1]
  def change
    create_table :wishlists do |t|
      t.string :room_id
      t.string :user_id

      t.timestamps
    end
  end
end
