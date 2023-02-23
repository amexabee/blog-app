require_relative 'comment'

class Post < ApplicationRecord
  def self.update_counter(user)
    return if user.posts_counter.nil?

    user.posts_counter += 1
    user.save
  end

  def self.five_recent_comments(post)
    Comment.where(post_id: post.id).limit(5).order(created_at: :DESC)
  end
end
