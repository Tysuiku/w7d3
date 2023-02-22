require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "GET /users(:index)" do
    it "renders the users index" do
      get users_url
      expect(response).to have_http_status(200)
      expect(response.body).to include("users index")
    end
  end
end
