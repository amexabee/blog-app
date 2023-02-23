class Post < ApplicationRecord
  def self.update_counter(user)
    return if user.posts_counter.nil?
    user.posts_counter += 1 
    user.save
  end
end
