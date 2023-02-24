require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(name: 'Amanuel', posts_counter: 0) 
  post = Post.new(author: user, title: nil, comments_counter: nil, likes_counter: nil) 
  before { post.save }

  describe "validations" do
    it "requires a title to be present" do
      expect(post).not_to be_valid
    end

    it "requires the title to be at most 250 characters long" do
      post.title = 'a' * 251
      expect(post).not_to be_valid
    end

    it "requires the comments_counter to be a non-negative integer" do
      post.comments_counter = -1
      expect(post).not_to be_valid
    end

    it "requires the likes_counter to be a non-negative integer" do
      post.likes_counter = -1
      expect(post).not_to be_valid
    end
  end

  describe "#update_counter" do
    it 'update the post counter' do
        expect(post.update_counter).to eq(user.update(posts_counter: user.posts.count))
      end
  end

  describe '#five_recent_comments' do
    it 'returns five recent comments' do
      expect(post.five_recent_comments).to eq(post.comments.reverse.take(5))
    end
  end 
end