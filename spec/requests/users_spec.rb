require 'rails_helper'

RSpec.describe "Users", type: :request do
 
  describe 'GET "/users" ' do
    before (:example){ get '/users'}

    it "check if the response is successful" do
         expect(response).to have_http_status(200)
    end

    it "check if the correct template is rendered" do
         expect(response).to render_template('index')
    end

    it "check If the response body includes correct placeholder text" do
      expect(response.body).to include('Here is a list of users')
    end

  end

  describe 'GET "/users/4" ' do
    before (:example){ get '/users/4'}

    it "check if the response is successful" do
         expect(response).to have_http_status(200)
    end

    it "check if the correct template is rendered" do
         expect(response).to render_template('show')
    end

    it "check If the response body includes correct placeholder text" do
      expect(response.body).to include('Here is a page for user 4')
    end

  end
end
