#カテゴリーを選択してコメントを入力すると公園のshowページに表示される
require 'rails_helper'

RSpec.describe 'comment投稿機能', type: :system do
  let!(:park) { FactoryBot.create(:park)}
  let!(:user_second) { FactoryBot.create(:user_second)}
  let!(:category) { FactoryBot.create(:category)}

  describe 'コメント投稿機能' do
    context 'ログイン後、カテゴリーを選択し、コメントを投稿すると' do
      it '公園のページにコメントが表示される' do
        visit new_session_path
        fill_in 'session[email]', with: user_second.email
        fill_in 'session[password]', with: user_second.password
        click_button 'commit'
        visit park_path(park.id)

        click_link '口コミを投稿！'
        select "周辺情報", from: "comment_category_id"
        fill_in 'comment[content]', with: 'テストコメント書くよ〜'
        click_button 'commit'
        expect(page).to have_content 'テスト公園'
        expect(page).to have_content 'テストコメント書くよ〜'
      end
      it '編集をクリックすると編集ができる' do
        visit new_session_path
        fill_in 'session[email]', with: user_second.email
        fill_in 'session[password]', with: user_second.password
        click_button 'commit'
        visit park_path(park.id)

        click_link '口コミを投稿！'
        select "周辺情報", from: "comment_category_id"
        fill_in 'comment[content]', with: 'テストコメント書くよ〜'
        click_button 'commit'

        click_link '編集'
        fill_in 'comment[content]', with: '編集するよ'
        click_button 'commit'
        expect(page).to have_content 'テスト公園'
        expect(page).to have_content '編集するよ'
      end
      it '消去をクリックすると消去できる' do
        visit new_session_path
        fill_in 'session[email]', with: user_second.email
        fill_in 'session[password]', with: user_second.password
        click_button 'commit'
        visit park_path(park.id)

        click_link '口コミを投稿！'
        select "周辺情報", from: "comment_category_id"
        fill_in 'comment[content]', with: 'テストコメント書くよ〜'
        click_button 'commit'
        page.accept_confirm do
          click_link '消去'
        end
        expect(page).to have_content '消去しました'
      end
    end
  end
end