require 'rails_helper'

RSpec.describe Like, type: :model do
  post1 = Post.new(title: nil, comments_counter: nil, likes_counter: nil)
  like = Like.new(post: post1, author: nil)
  before { post1.save }

  describe '#update_counter' do
    it 'update the likes counter' do
      expect(like.update_counter).to eq(post1.update(likes_counter: post1.likes.count))
    end
  end
end
