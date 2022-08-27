#カテゴリーを選択してコメントを入力すると公園のshowページに表示される
require 'rails_helper'

RSpec.describe 'comment投稿機能', type: :system do
  let!(:park) { FactoryBot.create(:park)}
  let!(:user) { FactoryBot.create(:user)}
  let!(:category) { FactoryBot.create(:category)}
  before do
    visit new_session_path
    fill_in 'session[email]', with: 'test@gmail.com'
    fill_in 'session[password]', with: '123456'
    click_button 'commit'
  end
  context 'カテゴリーとコメントを投稿したら' do
    it 'パークのページに表示される' do
      visit park_path(1)
      click_link '口コミを投稿！'
      select "周辺情報", from: "comment_category_id"
      fill_in 'comment[content]', with: 'テストコメント書くよ〜'
      click_button 'commit'
      expect(page).to have_content 'テスト公園'
      expect(page).to have_content 'テストコメント書くよ〜'
    end
  end
end