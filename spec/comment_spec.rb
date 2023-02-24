require 'rails_helper'

RSpec.describe Comment, type: :model do
  post = Post.new(title: nil, comments_counter: nil, likes_counter: nil) 
  comment = Like.new(post: post) 
  before { post.save }

  describe "#update_counter" do
    it 'update the comments counter' do
        expect(comment.update_counter).to eq(post.update(comments_counter: post.comments.count))
      end
  end
end