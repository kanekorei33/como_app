require 'rails_helper'

RSpec.describe '管理者ログイン機能', type: :system do
  describe '管理者ログイン' do
      let!(:user) { FactoryBot.create(:user) }
      let!(:admin_user) { FactoryBot.create(:admin_user) }

    context 'admin:trueのユーザーがadminへのパスを入力' do
      it 'admin画面に遷移できる' do
        visit new_session_path
        fill_in 'session[email]', with: admin_user.email
        fill_in 'session[password]', with: admin_user.password
        click_button 'commit'
        visit rails_admin_path
        expect(current_path).to eq rails_admin_path
      end
    end
    context '一般ユーザーがログインしている場合' do
      it '警告文が表示される' do
        visit new_session_path
        fill_in 'session[email]', with: 'upaupa@gmail.com'
        fill_in 'session[password]', with: '123456'
        click_on 'Log in'
        visit rails_admin_path
        expect(page).to have_content '管理者以外はアクセス不可！'
      end
    end
  end
end