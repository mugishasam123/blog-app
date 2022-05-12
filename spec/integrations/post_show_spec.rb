require 'rails_helper'

RSpec.feature 'Tests for User posts show page' , type: :feature do


    describe 'posts#show' do
  
  
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
  
      fill_in 'Email' , with: 'john@gmail.com'
      fill_in 'Email' , with: 'johnsecret'
  
     end
  
     click_button 'Log in'
     visit user_post_path (user_id: @user1.id, id:@post1.id)
  end
  
  

  
  scenario "I can see a post's title." do
    expect(page).to have_content 'first post'
  end

  scenario "I can see who wrote the post." do 
    expect(page).to have_content "Post by John"
  end
  

  
  scenario "I can see how many comments a post has." do
    expect(page).to have_content 'Comments:3'
  end
  
  
  scenario "I can see how many likes a post has." do 
    expect(page).to have_content 'Likes:3'
  
    
  scenario "I can see the post body." do
    expect(page).to have_content 'test for views post-index page'
  end
  
  scenario "I can see the username of each commentor." do
    expect(page).to have_content 'john: test comment 1'
    expect(page).to have_content 'john: test comment 2'
    expect(page).to have_content 'john: test comment 3'
  end
 
  
  
  end
  
  end