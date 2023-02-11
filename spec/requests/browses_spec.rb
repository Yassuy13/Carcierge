require 'rails_helper'

RSpec.describe "Browses", type: :request do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:browse) { create(:browse, post_id: post.id) }
  
  describe "GET /new" do
    it "リクエストが成功すること" do
      sign_in user
      get "/posts/#{post.id}/browses/new"
      expect(response).to have_http_status(:success)
    end
  end
end
