require 'rails_helper'

RSpec.describe Browse, type: :system do
  let(:user) { create(:user) }
  let(:category) { create(:category, user_id: user.id) }
  let(:post) { create(:post, category_id: category.id) }
  let(:browse) { create(:browse, post_id: post.id) }

  describe '回答' do
    it '正常に回答できること' do
      sign_in user
      visit "/posts/#{post.id}/browses/new"
      fill_in 'browse[body]', with: 'content'
      expect { click_button '投稿' }.to change { post.browses.count }.by(1)
    end
  end
end
