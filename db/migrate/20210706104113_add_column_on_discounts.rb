class AddColumnOnDiscounts < ActiveRecord::Migration[6.1]
  def change
    add_column :discounts, :description, :string
  end
end
