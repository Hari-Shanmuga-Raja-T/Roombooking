class ChangeColumnOnDiscounts < ActiveRecord::Migration[6.1]
  def change
    change_column :discounts, :description, :string, :default => ""
    change_column :discounts, :percentage, :integer, :default => 0
  end
end
