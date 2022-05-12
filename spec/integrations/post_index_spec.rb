require 'rails_helper'

RSpec.feature 'Tests for User posts index page', type: :feature do
  describe 'posts#index' do
    before(:each) do
      @user1 = User.create(Name: 'John', Photo: 'https://mir-s3-cdn-cf.behance.net/project_modules/disp/ea7a3c31@user116391@user19.567197ac70bda.png',
                           Bio: 'Teacher from Mexico.', email: 'john@gmail.com',
                           password: 'johnsecret', confirmed_at: Time.now, PostsCounter: 0, role: 'admin')

      @post1 = Post.create(Title: 'first post', Text: 'test for views post-index page',
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

      @coment1 = Comment.create(Text: 'test comment 1', author_id: @user1.id, post_id: @post1.id)
      @coment2 = Comment.create(Text: 'test comment 2', author_id: @user1.id, post_id: @post1.id)
      @coment3 = Comment.create(Text: 'test comment 3', author_id: @user1.id, post_id: @post1.id)
      @like = Like.create(author_id: @user1.id, post_id: @post1.id)
      @like = Like.create(author_id: @user1.id, post_id: @post1.id)
      @like = Like.create(author_id: @user1.id, post_id: @post1.id)

      visit user_session_path

      within 'form' do
        fill_in 'Email', with: 'john@gmail.com'
        fill_in 'Email', with: 'johnsecret'
      end

      click_button 'Log in'
      visit user_posts_path user_id: @user1.id
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

    scenario "I can see a post's title." do
      expect(page).to have_content 'first post'
      expect(page).to have_content 'second post'
      expect(page).to have_content 'third post'
      expect(page).to have_content 'Testing post-index page'
    end

    scenario "I can see some of the post's body." do
      expect(page).to have_content 'test for views post-index page'
    end

    scenario 'I can see the first comments on a post.' do
      expect(page).to have_content 'test comment 1'
      expect(page).to have_content 'test comment 2'
      expect(page).to have_content 'test comment 3'
    end

    scenario 'I can see how many comments a post has.' do
      expect(page).to have_content 'Comments:3'
    end

    scenario 'I can see how many likes a post has.' do
      expect(page).to have_content 'Likes:3'
    end

    scenario 'I can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_content 'See All Posts'
    end

    scenario "When I click on a post, it redirects me to that post's show page." do
      click_on 'first post', match: :first
      expect(current_path).to eq 'users/1/posts/1'
    end
  end
end
