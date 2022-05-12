require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations for User model' do
    before(:each) do
      @user = User.create(Name: 'John', email: 'some@gmail', password: 'secret')
    end

    it 'if there is name' do
      @user.Name = nil
      expect(@user).to_not be_valid
    end

    it 'PostsCounter must be greater than or equal to zero' do
      @user.PostsCounter = -1
      expect(@user).to_not be_valid
    end

    it 'PostsCounter must be greater than or equal to zero' do
      @user.PostsCounter = 7
      expect(@user).to be_valid
    end
  end
end
