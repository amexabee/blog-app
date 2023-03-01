require 'rails_helper'

RSpec.describe "UsersController", type: :request do
  describe "GET #index" do
    before do
      User.create!(name: "Amanuel", posts_counter: 0)
    end

    it "returns a successful response" do
      get "/users"
      expect(response).to be_successful
    end

    it "renders the index template" do
      get "/users"
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    let(:user) { User.create!(name: "Alice", posts_counter: 0) }

    it "returns a successful response" do
      get "/users/#{user.id}"
      expect(response).to be_successful
    end

    it "renders the show template" do
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end
  end
end