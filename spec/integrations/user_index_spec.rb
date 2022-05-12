require 'rails_helper'

RSpec.feature 'Tests for users index page', type: :feature do
  describe 'users#index' do
    before(:each) do
      @user1 = User.create(Name: 'John', Photo: 'https://mir-s3-cdn-cf.behance.net/project_modules/disp/ea7a3c32163929.567197ac70bda.png',
                           Bio: 'Teacher from Mexico.', email: 'john@gmail.com',
                           password: 'johnsecret', confirmed_at: Time.now, PostsCounter: 0, role: 'admin')
      @user2 = User.create(Name: 'Nuri', Photo: 'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png',
                           Bio: 'Teacher from Mexico.', email: 'photo@gmail.com',
                           password: 'nurisecret', confirmed_at: Time.now, PostsCounter: 0)
      @user3 = User.create(Name: 'Rachid', Photo: 'https://static.toiimg.com/thumb/resizemode-4,msid-76729750,imgsize-249247,width-720/76729750.jpg',
                           Bio: 'Teacher from Mexico.', email: 'rachid@gmail.com',
                           password: 'rachidsecret', confirmed_at: Time.now, PostsCounter: 0)
      @post = Post.create(Title: 'Testing post-index page', Text: 'test for views post-index page',
                          author_id: @user2.id)
      @post = Post.create(Title: 'Testing post-index page', Text: 'test for views post-index page',
                          author_id: @user1.id)
      @post = Post.create(Title: 'Testing post-index page', Text: 'test for views post-index page',
                          author_id: @user3.id)
      @post = Post.create(Title: 'Testing post-index page', Text: 'test for views post-index page',
                          author_id: @user3.id)
    end

    scenario 'I can see the username of all other users.' do
      expect(page).to have_content 'John'
      expect(page).to have_content 'Nuri'
      expect(page).to have_content 'Rachid'
    end

    scenario 'I can see the profile picture for each user.' do
      expect(page.first('img')['src']).to have_content 'https://mir-s3-cdn-cf.behance.net/project_modules/disp/ea7a3c32163929.567197ac70bda.png'
    end

    scenario 'I can see the number of posts each user has written.' do
      expect(page).to have_content 'Number of Posts:1'
      expect(page).to have_content 'Number of Posts:2'
    end

    scenario "When I click on a user, I am redirected to that user's show page." do
      click_on 'john', match: :first
      expect(current_path).to eql user_path @user1.id
    end
  end
end
