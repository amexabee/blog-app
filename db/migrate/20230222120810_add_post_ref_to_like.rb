class AddPostRefToLike < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :post_id, :integer
    add_index :likes, :post_id
    add_foreign_key :likes, :posts, column: :post_id
  end
end
