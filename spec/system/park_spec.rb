require 'rails_helper'

RSpec.describe '公園機能テスト', type: :system do

  let!(:user) { FactoryBot.create(:user)}
  let!(:playground) { FactoryBot.create(:playground)}
  let!(:second_playground) { FactoryBot.create(:second_playground)}

  let!(:institution) { FactoryBot.create(:institution)}
  let!(:second_institution) { FactoryBot.create(:second_institution)}

  let!(:category) { FactoryBot.create(:category)}
  let!(:second_category) { FactoryBot.create(:second_category)}
  let!(:third_category) { FactoryBot.create(:third_category)}

  let!(:park) { FactoryBot.create(:park, playground_ids: [1, 2], institution_ids: [2])}
  let!(:second_park) { FactoryBot.create(:second_park, playground_ids: [1, 2], institution_ids: [1])}
  let!(:third_park) { FactoryBot.create(:third_park, playground_ids: [2], institution_ids: [1, 2])}

  let!(:comment) { FactoryBot.create(:comment, user: user, park: park, category: category)}
  let!(:second_comment) { FactoryBot.create(:second_comment, user: user, park: second_park, category: second_category)}
  let!(:third_comment) { FactoryBot.create(:third_comment, user: user, park: third_park, category: third_category)}

  describe '公園検索機能' do
    context '遊具のチェックボックスを選択すると' do
      it '紐づく公園が一覧で表示される' do
        visit root_path
        find('#q_playgrounds_id_eq_any_1').click
        find('.search_btn').click
        expect(page).to have_content 'テスト公園'
        expect(page).to have_content '二つ目の公園'
      end
    end

    context '施設のチェックボックスを選択すると' do
      it '紐づく公園が一覧で表示される' do
        visit root_path
        find('#q_institutions_id_eq_any_2').click
        find('.search_btn').click
        expect(page).to have_content 'テスト公園'
        expect(page).to have_content 'みっつ目の公園'
      end
    end

    context '住所を入れると' do
      it '該当する公園が表示される' do
        visit root_path
        fill_in 'q[name_or_address_cont]', with: '札幌市白石区テストアドレス'
        find('.search_last_btn').click
        expect(page).to have_content 'みっつ目の公園'
      end
    end

    context '公園の名前を入力すると' do
      it '該当する公園が表示される' do
        visit root_path
        fill_in 'q[name_or_address_cont]', with: 'テスト公園'
        find('.search_last_btn').click
        expect(page).to have_content 'テスト公園'
      end
    end
  end

  describe '口コミ検索機能' do
    context '公園のshow画面でカテゴリーを選択すると' do
      it 'そのカテゴリに合致した口コミ情報が表示される' do
        visit park_path(park.id)
        select "周辺情報", from: "q_category_id_eq"
        expect(page).to have_content 'コメントのテストだよ'
      end
    end
  end

  describe 'お気に入り機能' do
    context 'ログイン後、特定の公園の画面で「お気に入りする」をクリックすると' do
      before do
        visit new_session_path
        fill_in 'session[email]', with: user.email
        fill_in 'session[password]', with: user.password
        click_button 'commit'
        visit park_path(park.id)
        click_link 'お気に入りする'
      end
      it 'その公園がお気に入り登録される' do
        expect(page).to have_content 'お気に入り登録しました'
      end
      it 'マイページにお気に入り登録した公園名が表示される' do
        visit user_path(user.id)
        expect(page).to have_content park.name
      end      
    end
  end
end