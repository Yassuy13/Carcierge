require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /show" do
    let(:user) { create(:user) }

    it "リクエストが成功すること" do
      sign_in user
      get user_path(user)
      expect(response).to have_http_status(200)
    end
  end
end
