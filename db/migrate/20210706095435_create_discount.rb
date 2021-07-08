class CreateDiscount < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.string :hotel_id
      t.integer :percentage

      t.timestamps
    end
  end
end
