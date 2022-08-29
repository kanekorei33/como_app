require 'rails_helper'

RSpec.describe 'Parkモデル機能', type: :model do
  context '新規登録の全て記入されていた場合' do
    it "バリデーションが通る" do
      park = Park.new(
        name: "DIC公園",
        introduction: "DICの公園です",
        address: "東京都渋谷区円山町",
        main_image: "#{Rails.root}/spec/fixtures/ブランコ.jpg"
      )
      expect(park).to be_valid
    end
  end

  context '新規登録のnameがない時' do
    it "バリデーションが通らない" do
      park = Park.new(
        name: "",
        introduction: "DICの公園です",
        address: "東京都渋谷区円山町",
        main_image: "#{Rails.root}/spec/fixtures/ブランコ.jpg"
      )
      expect(park).not_to be_valid
    end
  end

  context '新規登録のintroductionがない時' do
    it "バリデーションが通らない" do
      park = Park.new(
        name: "DIC公園",
        introduction: "",
        address: "東京都渋谷区円山町",
        main_image: "#{Rails.root}/spec/fixtures/ブランコ.jpg"
      )
      expect(park.valid?).to eq false
    end
  end

  context '新規登録のaddressがない時' do
    it "バリデーションが通らない" do
      park = Park.new(
        name: "DIC公園",
        introduction: "DICの公園です",
        address: "",
        main_image: "#{Rails.root}/spec/fixtures/ブランコ.jpg"
      )
      expect(park).not_to be_valid
    end
  end
end