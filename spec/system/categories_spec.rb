require 'rails_helper'

RSpec.describe Category, type: :system do
  let!(:user) { create(:user) }
  let!(:category) { create(:category, user_id: user.id) }
    
  describe 'カテゴリー登録のテスト' do
    before do
      sign_in user
      visit new_category_path
    end

    it '正常に登録が出来ること' do
      fill_in 'category[name]', with: 'name'
      expect { click_button '登録する' }.to change { user.categories.count }.by(1)
    end
  end
end
