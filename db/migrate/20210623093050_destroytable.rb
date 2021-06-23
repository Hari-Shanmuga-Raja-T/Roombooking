class Destroytable < ActiveRecord::Migration[6.1]
  def change
    drop_table :oauth_access_grants, force: :cascade
  end
end
