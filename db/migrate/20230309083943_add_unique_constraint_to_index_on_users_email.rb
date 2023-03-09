class AddUniqueConstraintToIndexOnUsersEmail < ActiveRecord::Migration[7.0]
  def up
    execute "ALTER TABLE users ADD CONSTRAINT index_users_on_email_unique UNIQUE (email);"
  end

  def down
    execute "ALTER TABLE users DROP CONSTRAINT index_users_on_email_unique;"
  end
end
