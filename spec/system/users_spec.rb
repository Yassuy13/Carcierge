require 'rails_helper'

RSpec.describe User, type: :system do
  let!(:user) { create(:user) }

  before do
    visit new_user_registration_path
    fill_in 'user[name]', with: 'test'
    fill_in 'user[email]', with: 'user@email.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
  end

  it '正常にサインアップできること' do
    click_button '登録'
    expect(page).to have_content 'アカウント登録が完了しました'
  end

  describe '異常値' do
    before do
      visit new_user_registration_path
      fill_in 'user[name]', with: 'test'
      fill_in 'user[email]', with: 'user@email.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
    end

    describe '名前' do
      context '空白の場合' do
        it '失敗し、エラーメッセージが表示されること' do
          fill_in 'user[name]', with: ''
          click_button '登録'
          expect(page).to have_content '名前を入力してください'
        end
      end
    end

    describe 'メールアドレス' do
      context '空白の場合' do
        it '失敗し、エラーメッセージが表示されること' do
          fill_in 'user[email]', with: ''
          click_button '登録'
          expect(page).to have_content 'Eメールを入力してください'
        end
      end
    end

    describe 'パスワード' do
      context '空白の場合' do
        it '失敗し、エラーメッセージが表示されること' do
          fill_in 'user[password]', with: ''
          fill_in 'user[password_confirmation]', with: ''
          click_button '登録'
          expect(page).to have_content 'パスワードを入力してください'
        end
      end

      context '文字数が少ない場合' do
        it '失敗し、エラーメッセージが表示されること' do
          fill_in 'user[password]', with: 'a' * 5
          fill_in 'user[password_confirmation]', with: 'a' * 5
          click_button '登録'
          expect(page).to have_content 'パスワードは6文字以上で入力してください'
        end
      end

      context 'パスワードが確認用と異なる場合' do
        it '失敗し、エラーメッセージが表示されること' do
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'hogehoge'
          click_button '登録'
          expect(page).to have_content 'パスワード（確認用）とパスワードの入力が一致しません'
        end
      end
    end
  end

  let!(:user) { create(:user) }

  describe '正常値' do
    it '正常にサインインできること' do
      visit new_user_session_path
      fill_in 'user[email]', with: 'user@email.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
      expect(page).to have_current_path "/users/sign_in"
    end
  end

  describe 'ゲストユーザーログイン' do
    before do
      visit root_path
    end

    it 'ゲストユーザーとしてログインできること' do
      click_link 'ゲストログイン'
      expect(page).to have_content 'ゲストユーザーとしてログインしました。'
    end
  end
end
