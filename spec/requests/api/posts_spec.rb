require 'swagger_helper'

RSpec.describe 'api/posts', type: :request do
  fixtures :users
  describe "GET /api/users/:user_id/posts/" do
    it "responds with 200" do
      user = users(:tom) 
      get api_user_posts_path(user)
      expect(response).to have_http_status(200)
    end
  end
end
