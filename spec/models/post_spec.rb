require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'when post is created' do
    before do
      User.create(username: "me", email: "me@user.com", password: "itsmebro")
    end

    it 'has an author' do
      post = Post.new(content: "Some content", likes: 0)
      expect { post.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'has content' do
      post = User.first.posts.new(content: "", likes: 2)
      expect { post.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'has association with user' do
      post = User.first.posts.create(content: "i belong to this author", likes: 999)
      first_post = Post.first
      expect(first_post).to eq(post)
    end
    it 'has zero likes by default' do
      post = User.first.posts.create(content: "i belong to this author")
      expect(post.likes).to eq(0)
    end
  end
end
