class Like < ApplicationRecord
  def self.update_counter(post)
    return if post.comments_counter.nil?
    post.comments_counter += 1 
    post.save
  end
end
