require 'rails_helper'

RSpec.describe User, type: :model do
  context "User sign-up" do
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
end
