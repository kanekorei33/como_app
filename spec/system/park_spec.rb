require 'rails_helper'

RSpec.describe '公園機能テスト', type: :system do

  let!(:park) { FactoryBot.create(:park, playground_ids: [1, 2], institution_ids: [2])}
  let!(:second_park) { FactoryBot.create(:second_park, playground_ids: [1, 2], institution_ids: [1])}
  let!(:third_park) { FactoryBot.create(:third_park, playground_ids: [2], institution_ids: [1, 2])}
  let!(:user) { FactoryBot.create(:user)}
  let!(:playground) { FactoryBot.create(:playground)}
  let!(:second_playground) { FactoryBot.create(:second_playground)}
  let!(:institution) { FactoryBot.create(:institution)}
  let!(:second_institution) { FactoryBot.create(:second_institution)}
  let!(:comment) { FactoryBot.create(:comment)}
  let!(:second_comment) { FactoryBot.create(:second_comment)}
  let!(:third_comment) { FactoryBot.create(:third_comment)}

  context '公園検索機能' do
    it '遊具のチェックボックスを選択すると紐ずく公園が一覧で表示される' do
      visit root_path
      check "playground_ids (1)"
      click_button "検索"
      expect(page).to have_content 'テスト公園'
      expect(page).to have_content '二つ目の公園'
    end
  end

  context '公園検索機能' do
    it '施設のチェックボックスを選択すると紐ずく公園が一覧で表示される' do
      visit root_path
      check "institution_ids (2)"
      click_button "検索"
      expect(page).to have_content 'テスト公園'
      expect(page).to have_content 'みっつ目の公園'
    end
  end

  context '公園検索機能' do
    it '住所を入れると公園が表示される' do
      visit root_path
      fill_in 'q[name_or_address_cont]' with:'札幌市白石区テストアドレス'
      click_button "検索"
      expect(page).to have_content 'みっつ目の公園'
    end
  end

  context '公園検索機能' do
    it '名前を入れると公園が表示される' do
      visit root_path
      fill_in 'q[name_or_address_cont]' with:'テスト公園'
      click_button "検索"
      expect(page).to have_content 'テスト公園'
    end
  end

  context 'コメント検索機能' do
    it 'カテゴリーを選択すると選択したカテゴリー一覧が表示される' do
      visit park_path(1)
      select "周辺情報", from: "q[category_id_ep]"
      expect(page).to have_content '周辺情報'
      expect(page).not_to have_content 'イベント情報'
    end
  end

  context 'コメント検索機能' do
    it 'カテゴリーを選択すると選択したカテゴリー一覧が表示される' do
      visit new_session_path
      fill_in 'session[email]', with: 'test@gmail.com'
      fill_in 'session[password]', with: '123456'
      click_button 'commit'
      visit park_path(1)
      click_link 'お気に入りする'
      expect(page).not_to have_content 'お気に入り登録しました'
    end
  end
end