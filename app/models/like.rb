class Like < ApplicationRecord
  def self.update_counter(post)
    return if post.likes_counter.nil?

    post.likes_counter += 1
    post.save
  end
end
