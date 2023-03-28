require 'rails_helper'

RSpec.describe "Categories", type: :request do
  let!(:user) { create(:user) }
  let!(:category) { create(:category, user_id: user.id) }

  describe "GET /new" do
    it "リクエストが成功すること" do
      sign_in user
      get new_category_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "リクエストが成功すること" do
      sign_in user
      get categories_path
      expect(response).to have_http_status(:success)
    end
  end
end
