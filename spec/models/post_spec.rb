require 'rails_helper'


RSpec.describe Post, type: :model do
  describe 'For the Post model' do
    before(:each) do
      @user = User.create(Name: 'John', Bio: 'Teacher from Dubai', PostsCounter: 0, confirmed_at: Time.now,
                          email: 'some@mail.com', password: '111111')
      @post = Post.create(author: @user, Title: 'Test', Text: 'testing', LikesCounter: 7,
                          CommentsCounter: 5)
    end

    before { @post.save }

    it 'if there is max 250 characters' do
      @post.Title = 'Testing'
      expect(@post).to be_valid
    end

    it 'if likes counter is integer' do
      @post.LikesCounter = 5
      expect(@post).to be_valid
    end

    it 'if likes counter greater than or equal to zero' do
      @post.LikesCounter = -9
      expect(@post).to_not be_valid
    end

    it 'if comments counter greater than or equal to zero.' do
      @post.CommentsCounter = -5
      expect(@post).to_not be_valid
    end

    it 'if comments counter is integer' do
      @post.CommentsCounter = 8
      expect(@post).to be_valid
    end
  end
end