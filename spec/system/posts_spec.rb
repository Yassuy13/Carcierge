require 'rails_helper'

RSpec.describe Post, type: :system do
  describe '投稿に関するテスト' do
    let!(:user) { create(:user) }
    let!(:post) { create(:post, user_id: user.id) }
    
    describe '投稿のテスト' do
      before do
        sign_in user
        visit new_post_path(post)
      end

      it '正常に投稿が出来ること' do
        fill_in 'post[title]', with: 'title'
        fill_in 'post[body]', with: 'content'
        expect { click_button '投稿' }.to change { user.posts.count }.by(1)
      end
    end

    describe "削除のテスト" do
      before do
        sign_in user
        visit posts_path
      end
  
      it "削除されるか" do
        expect { post.destroy }.to change(Post, :count).by(-1)
      end
    end
  end
end
