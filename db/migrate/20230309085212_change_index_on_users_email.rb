class ChangeIndexOnUsersEmail < ActiveRecord::Migration[7.0]
  def up
    remove_index :users, :email, name: 'index_users_on_email'
    # remove_index :users, :email, name: 'index_users_on_email_unique'
    # add_index :users, :email, unique: true, name: 'index_users_on_email'
  end

  # def down
  #   remove_index :users, :email
  #   add_index :users, :email, name: 'index_users_on_email'
  # end
end
