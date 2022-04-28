require 'rails_helper'
require 'ffi'

RSpec.describe "Posts", type: :request do
  describe 'GET "/users/1/posts" ' do
    before (:example){ get '/users/1/posts'}

    it "check if the response is successful" do
         expect(response).to have_http_status(200)
    end

    it "check if the correct template is rendered" do
         expect(response).to render_template('index')
    end

    it "check If the response body includes correct placeholder text" do
      expect(response.body).to include('Here are list of posts by user 1')
    end

  end

  describe 'GET "/users/1/posts/3" ' do
    before (:example){ get '/users/1/posts/3'}

    it "check if the response is successful" do
         expect(response).to have_http_status(200)
    end

    it "check if the correct template is rendered" do
         expect(response).to render_template('show')
    end

    it "check If the response body includes correct placeholder text" do
      expect(response.body).to include('Here is a page for post with id 3 by user 1')
    end

  end
end
