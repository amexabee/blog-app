require 'rails_helper'

RSpec.describe Like, type: :model do
  post = Post.new(title: nil, comments_counter: nil, likes_counter: nil) 
  like = Like.new(post: post) 
  before { post.save }

  describe "#update_counter" do
    it 'update the likes counter' do
        expect(like.update_counter).to eq(post.update(likes_counter: post.likes.count))
      end
  end
end