require 'rails_helper'

RSpec.describe 'User index test', type: :feature do
  before :each do
    @first_user = User.create(name: 'Yousef', bio: 'Front end Engineer',
                              photo: 'https://cdn.britannica.com/39/7139-050-A88818BB/Himalayan-chocolate-point.jpg?w=400&h=300&c=crop', posts_counter: 4)
    @second_user = User.create(name: 'Amanuel', bio: 'Student',
                               photo: 'https://cdn.britannica.com/39/7139-050-A88818BB/Himalayan-chocolate-point.jpg?w=400&h=300&c=crop', posts_counter: 5)

    visit users_path
  end

  it 'Should diplay all usernames of the users' do
    expect(page).to have_content(@first_user.name)
    expect(page).to have_content(@second_user.name)
  end

  it 'Should display the photo of each user' do
    expect(page.html).to include('user photo')
  end

  it 'should have the number of posts of each user' do
    expect(page).to have_content("Number of posts: #{4}")
    expect(page).to have_content("Number of posts: #{5}")
  end 

  it 'should redirect the user to show page if its clicked' do
    click_link(@first_user.name)
    expect(page).to have_current_path user_path(@first_user.id)
  end

end
