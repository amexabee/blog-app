require 'rails_helper'

RSpec.describe 'Post index test', type: :feature do
  before :each do
    @user = User.create(name: 'Yousef', bio: 'Front end Engineer', posts_counter: 0)
    @post = Post.create(author: @user, title: 'Hello', text: 'Hi there', comments_counter: 0, likes_counter: 0)
    @comment = Comment.create(post: @post, author: @user, text: 'Hi')
    visit user_posts_path(@user.id)
  end

  it 'Should diplay the picture of the user' do 
    assert page.has_xpath?("//img[@src = 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
          and @alt = 'user photo']")
  end

  it 'Should diplay the user\'s username' do
    expect(page).to have_content(@user.name)
  end

  it 'should have the number of posts of the user' do
    expect(page).to have_content("Number of posts: #{@user.posts_counter}")
  end 
  
  it 'should display a post\'s title' do
    expect(page).to have_content(@post.title)
  end 
  
  it 'should display a post\'s body' do
    expect(page).to have_content(@post.text)
  end
  
  it 'should display comments of the post' do
    expect(page).to have_content("Comment: #{@comment.text}")
  end 

  it 'should have the number of comments of the post' do
    expect(page).to have_content("Comments: #{@post.comments_counter}")
  end

  it 'should have the number of likes of the post' do
    expect(page).to have_content("Likes: #{@post.likes_counter}")
  end

  it 'should have a pagination option' do
    expect(page).to have_content('Pagination')
  end 

  it 'should redirect the user to show page if its clicked' do
    click_link(@post.title)
    expect(page).to have_current_path user_post_path(@user.id, @post.id)

  end
end 