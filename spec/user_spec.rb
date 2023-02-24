require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "requires name to be present" do
      user = User.new(posts_counter: 0)
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "requires posts_counter to be an integer greater than or equal to 0" do
      user = User.new(name: "John", posts_counter: "foo")
      expect(user).to_not be_valid
      expect(user.errors[:posts_counter]).to include("is not a number")

      user.posts_counter = -1
      expect(user).to_not be_valid
      expect(user.errors[:posts_counter]).to include("must be greater than or equal to 0")

      user.posts_counter = 0
      expect(user).to be_valid
    end
  end
end