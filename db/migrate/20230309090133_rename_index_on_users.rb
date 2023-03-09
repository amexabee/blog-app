class RenameIndexOnUsers < ActiveRecord::Migration[7.0]
  def change
    rename_index :users, "index_users_on_email_unique", "index_users_on_email"
  end
end
