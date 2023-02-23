class User < ApplicationRecord
  def self.three_recent_posts(user)
    Post.where(author_id: user.id).limit(3).order(created_at: :DESC)
  end
end
