require 'swagger_helper'

RSpec.describe 'api/comments', type: :request do
  fixtures :users, :posts 
  describe "GET /api/users/:user_id/posts/:post_id/comments" do
    it "responds with 200" do
      user = users(:tom)
      post = posts(:post_1)
      get api_user_post_comments_path(user.id, post.id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/users/:user_id/posts/:post_id/comments' do
    fixtures :users, :posts
     it 'if comment was added' do
      user = users(:tom)
      post = posts(:post_1)
      valid_attributes = {
        comment: {
        post: posts(:post_1),
        author: users(:tom),
        text: 'hi'
      }
      }
      post api_user_post_comments_path(user.id, post.id), params: valid_attributes
      puts response.body
      expect(response).to have_http_status(201)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['text']).to eq('hi')
    end
  end
end
