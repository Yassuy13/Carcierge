require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let!(:user) { create(:user) }
  let!(:category) { create(:category, user_id: user.id) }
  let!(:post) { create(:post, user_id: user.id, category_id: category.id) }

  describe "GET /new" do
    it "リクエストが成功すること" do
      sign_in user
      get new_post_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "リクエストが成功すること" do
      sign_in user
      get posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "リクエストが成功すること" do
      sign_in user
      get post_path(post)
      expect(response).to have_http_status(:success)
    end
  end
end
