require 'rails_helper'

RSpec.describe User, type: :model do
  context "when user sign-up" do
    it "requires username, email and password to sign up" do
      user = User.new(username: "dev", email: "dev@dev.dev", password: "myapp123")
      expect(user.save).to be true
    end
    it "requires username" do
      user = User.new(email: "dev@dev.dev", password: "myapp123")
      expect(user.save).to be false
    end
    it "requires email" do
      user = User.new(username: "dev", password: "myapp123")
      expect(user.save).to be false
    end
    it "requires password" do
      user = User.new(username: "dev", email: "dev@dev.dev")
      expect(user.save).to be false
    end
  end



  context "user associations" do
    before do
      4.times do |i|
        User.create!(username: "user#{i + 1}", email: "user#{i + 1}@example.com", password: "qwertyuiop")
      end
      UserFollowing.create(follower_id: User.second.id, following_id: User.first.id)
    end

    it "has many with user_following" do
      expect(User.first.follower_relationships).to exist
    end

    it "has association with itself as follower" do
      expect(User.first.followers.first).to eq(User.second)
    end
    it "has association with itself as following" do
      expect(User.second.followings.first).to eq(User.first)
    end
  end
end
