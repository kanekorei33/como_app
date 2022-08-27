require 'rails_helper'

RSpec.describe 'ユーザー機能テスト', type: :system do
let!(:park) { FactoryBot.create(:park)}

  context 'ユーザー新規登録' do
    it '公園の口コミページから新規登録したら、元いたページへ遷移する' do
      visit park_path(1)
      click_link 'ログインして口コミを投稿する'
      click_link '新規登録'
      fill_in 'user[name]', with: 'システムテスト'
      fill_in 'user[nickname]', with: 'テストするよ'
      fill_in 'user[email]', with: 'testtest@test.com'
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '123456'
      click_button 'commit'
      expect(page).to have_content 'お気に入り'
    end
  end
  context 'ログインフォーム入力' do
    it 'ログイン完了' do
      FactoryBot.create(:user)
      visit park_path(1)
      click_link 'ログインして口コミを投稿する'
      fill_in 'session[email]', with: 'test@gmail.com'
      fill_in 'session[password]', with: '123456'
      click_button 'commit'
      expect(page).to have_content 'お気に入り'
    end
  end
  context 'ログアウトテスト' do
    it 'ログアウト' do
      FactoryBot.create(:user)
      visit new_session_path
      fill_in 'session[email]', with: 'test@gmail.com'
      fill_in 'session[password]', with: '123456'
      click_button 'commit'
      click_link "ログアウト"
      expect(page).to have_content 'ログアウトしました'
    end
  end
  context 'ユーザー情報を編集' do
    it '編集内容が反映される' do
      FactoryBot.create(:user)
      visit new_session_path
      fill_in 'session[email]', with: 'test@gmail.com'
      fill_in 'session[password]', with: '123456'
      click_button 'commit'
      click_link 'マイページ'
      click_link 'plofile_Edit'
      fill_in 'user[name]', with: '名前変えるよ'
      fill_in 'user[email]', with: 'emailadd@gamil.com'
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '123456'
      click_button 'commit'
      expect(page).to have_content 'テストさん'
      expect(page).to have_content '編集しました'
    end
  end
  context 'ユーザーページのお気に入り確認テスト' do
    it 'お気に入りの公園リンクを押すとページにいける' do
    FactoryBot.create(:user)
      visit new_session_path
      fill_in 'session[email]', with: 'test@gmail.com'
      fill_in 'session[password]', with: '123456'
      click_button 'commit'
      visit park_path(1)
      click_link 'お気に入りする'
      click_link 'マイページ'
      click_link 'この公園ページへ行く'
      expect(page).to have_content 'テスト公園'
    end
  end
end
