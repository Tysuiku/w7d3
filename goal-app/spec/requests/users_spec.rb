require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "GET /users(:index)" do
    it "renders the users index" do
      get users_url
      expect(response).to have_http_status(200)
      expect(response.body).to include("users index")
    end
  end

  # describe "GET /users(:show)" do
  #   it "renders the users show" do
  #     get user_url
  #     expect(response).to have_http_status(200)
  #     expect(response.body).to include("users show")
  #   end
  # end
end
