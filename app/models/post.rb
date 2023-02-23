class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  after_save :update_counter

  def update_counter
    author.update(posts_counter: author.posts.count)
  end

  def five_recent_comments
    comments.includes(:post).limit(5).order(created_at: :DESC)
  end
end
