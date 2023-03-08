require 'rails_helper'

RSpec.describe 'Post index test', type: :feature do
  before :each do
    @user = User.create(name: 'Yousef', bio: 'Front end Engineer', posts_counter: 0)
    @post = Post.create(author: @user, title: 'Hello', text: 'Hi there', comments_counter: 0, likes_counter: 0)
    @comment = Comment.create(post: @post, author: @user, text: 'Hi')
    visit user_post_path(@user.id, @post.id)
  end
  
  it 'should display a post\'s title' do
    expect(page).to have_content(@post.title)
  end

  it 'should display a post\'s author' do
    expect(page).to have_content("Post ##{@post.id} by #{@post.author.name}")
  end 
  
  it 'should have the number of comments of the post' do
    expect(page).to have_content("Comments: #{@post.comments_counter}")
  end

  it 'should have the number of likes of the post' do
    expect(page).to have_content("Likes: #{@post.likes_counter}")
  end

  it 'should display a post\'s body' do
    expect(page).to have_content(@post.text)
  end

  it 'should display usernamename of the commentor' do
    expect(page).to have_content("Username: #{@comment.author.name}")
  end 
  
  it 'should display comment of the commentor' do
    expect(page).to have_content("Comment: #{@comment.text}")
  end 
end 