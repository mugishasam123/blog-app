require 'rails_helper'


RSpec.feature 'Tests for the login page', type: :feature do

  background{visit new_user_session_path}

  scenario 'can user see login form' do
    expect(page.has_field?('Email')).to be true
    expect(page.has_field?('password')).to be true
    expect(page.has_button?('Log in')).to be true
  end

  context 'form submission' do

    scenario 'when form is submitted without data' do
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    scenario 'when form is submitted with Incorrect  data' do
      within 'form' do
        fill_in 'Email', with: 'goghhjj@gmail.com'
        fill_in  'password', with: 'goghhjhgh'
      end
      button_click('Log in')
      expect(page).to have_content 'Invalid Email or password.'
    end

    scenario 'when form is submitted with correct  data' do
      @user3 = User.create(Name: 'John', Photo: 'somephoto', Bio: 'Teacher from Mexico.', email: 'john@gmail.com',
                           password: 'johnsecret', confirmed_at: Time.now, PostsCounter: 0, role: 'admin')

      within 'form' do
        fill_in 'Email', with: @user3.email
        fill_in  'password', with: @user3.password
      end
      button_click('Log in')
      expect(page).to have_content 'signed in successfully.'
    end

  end

end