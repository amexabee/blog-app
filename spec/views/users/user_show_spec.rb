require 'rails_helper'

Rspec.describe 'User index test', type: :feature do
  before :each do
    @first_user = User.create(name: 'Yousef', bio: 'Front end Engineer', photo: 'https://cdn.britannica.com/39/7139-050-A88818BB/Himalayan-chocolate-point.jpg?w=400&h=300&c=crop', posts_counter: 0)
    @first_post = Post.create(author: @first_user, title: "Hello World !", text: "World is ugly") 
    @second_post = Post.create(author: @first_user, title: "Hello World !", text: "World is ugly")
    @third_post = Post.create(author: @first_user, title: "Hello World !", text: "World is ugly")
  end

  it 'Should diplay the picture of the user' do 
    expect(page).to have_content(@first_user.photo)
  end

  it 'Should display the username of the user' do
    expect(page).to have_content(@first_user.name)
  end

  it 'should have the number of posts of each user'
    expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
  end 

  it 'should have  the user bio'
    expect(page).to have_content('Front end Engineer')
  end

  it 'should have the first 3 posts of the user'
  expect(page).to have_content(@first_post.title)
  expect(page).to have_content(@second_post.title)
  expect(page).to have_content(@third_post.title)
  end

  it 'should have have the see more posts button'
    expect(page).to have_link('Show All Posts')
  end 

  it 'should redirect to the post page if the post is clicked'
  click_on('Hello World !')
  expect(page).to have_current_path user_post_path(@first_user.id, @first_post.id)
  end

  it 'should redirect to posts index if show more posts is clicked'
    click_on('')
    expect(page).to have_current_path user_posts_path(@first_user.id)
  end
  
end
