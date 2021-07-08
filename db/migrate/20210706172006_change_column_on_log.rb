class ChangeColumnOnLog < ActiveRecord::Migration[6.1]
  def change
    remove_column :logs, :startdate,:string
    remove_column :logs, :enddate,:string
    add_column :logs, :startdate,:date
    add_column :logs, :enddate,:date
  end
end
