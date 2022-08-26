require 'rails_helper'

RSpec.describe 'userモデル機能', type: :model do
  context '新規登録の全て記入されていた場合' do
    it "バリデーションが通る" do
      @user = User.new(
        name: "test",
        nickname: "testさん",
        email: "test@example.com",
        password: "123456",
        password_confirmation: "123456"
      )
      expect(@user).to be_valid
    end
  end

  context '新規登録のnameがない時' do
    it "バリデーションが通らない" do
      @user = User.new(name: nil)
      @user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
  end

  context '新規登録のemailがない時' do
    it "バリデーションが通らない" do
      @user = User.new(email: nil)
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end
  end

  context '新規登録のemailの記述が正しくない時' do
    it "バリデーションが通らない" do
      @user = User.new(
        name: "test",
        nickname: "testさん",
        email: "testexample.com",
        password: "123456",
        password_confirmation: "123456"
      )
      expect(@user.valid?).to eq(false)
    end
  end

  context 'メアドが重複している場合' do
    it "無効であること" do
      User.create(
        name: "John",
        nickname: "ジョー",
        email: "test@example.com",
        password: "123456",
        password_confirmation: "123456"
      )

      @user = User.new(
        name: "Peter",
        nickname: "めー",
        email: "test@example.com",
        password: "123456",
        password_confirmation: "123456"
      )

      @user.valid?
      expect(@user.valid?).to eq(false)
    end
  end
  context '一般ユーザー作成時' do
    it 'admin:falseになる' do
      @user = User.new(
        name: "test",
        nickname: "testさん",
        email: "testexample.com",
        password: "123456",
        password_confirmation: "123456"
      )
      expect(user.admin).to eq false
    end
  end
end