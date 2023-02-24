require 'rails_helper'

RSpec.describe Comment, type: :model do
  post1 = Post.new(title: nil, comments_counter: nil, likes_counter: nil)
  comment = Comment.new(post: post1, text: 'text')
  before { post1.save }

  describe '#update_counter' do
    it 'update the comments counter' do
      expect(comment.update_counter).to eq(post1.update(comments_counter: post1.comments.count))
    end
  end
end
