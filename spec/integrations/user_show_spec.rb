require 'rails_helper'

RSpec.feature 'Tests for user show page', type: :feature do
  describe 'users#show' do
    before(:each) do
      @user1 = User.create(Name: 'John', Photo: 'https://mir-s3-cdn-cf.behance.net/project_modules/disp/ea7a3c31@user116391@user19.567197ac70bda.png',
                           Bio: 'Teacher from Mexico.', email: 'john@gmail.com',
                           password: 'johnsecret', confirmed_at: Time.now, PostsCounter: 0, role: 'admin')

      @post = Post.create(Title: 'first post', Text: 'test for views post-index page',
                          author_id: @user1.id)
      @post = Post.create(Title: 'second post', Text: 'test for views post-index page',
                          author_id: @user1.id)
      @post = Post.create(Title: 'third post', Text: 'test for views post-index page',
                          author_id: @user1.id)
      @post = Post.create(Title: 'Testing post-index page', Text: 'test for views post-index page',
                          author_id: @user1.id)
      @post = Post.create(Title: 'Testing post-index page', Text: 'test for views post-index page',
                          author_id: @user1.id)
      @post = Post.create(Title: 'Testing post-index page', Text: 'test for views post-index page',
                          author_id: @user1.id)
      @post = Post.create(Title: 'Testing post-index page', Text: 'test for views post-index page',
                          author_id: @user1.id)
      @post = Post.create(Title: 'Testing post-index page', Text: 'test for views post-index page',
                          author_id: @user1.id)

      visit user_session_path

      within 'form' do
        fill_in 'Email', with: 'john@gmail.com'
        fill_in 'Email', with: 'johnsecret'
      end

      click_button 'Log in'
      click_on 'john', match: :first
    end

    scenario "I can see the user's profile picture." do
      image = page.all('img')
      expect(image.size).to eql(1)
    end

    scenario "I can see the user's username." do
      expect(page.first('a')).to have_content 'john'
    end

    scenario 'I can see the number of posts the user has written.' do
      expect(page).to have_content 'Number of Posts:8'
    end

    scenario "I can see the user's bio." do
      expect(page).to have_content @user1.Bio
    end

    scenario "I can see the user's first 3 posts." do
      expect(page).to have_content 'first post'
      expect(page).to have_content 'second post'
      expect(page).to have_content 'third post'
    end

    scenario "I can see a button that lets me view all of a user's posts." do
      expect(page).to have_content 'See All Posts'
    end

    scenario "When I click a user's post, it redirects me to that post's show page." do
      click_on 'first post', match: :first
      expect(current_path).to eq '/users/1/posts/1'
    end

    scenario "When I click to see all posts, it redirects me to the user's post's index page." do
      click_button 'See All Posts'
      expect(current_path).to eq 'users/1/posts'
    end
  end
end
