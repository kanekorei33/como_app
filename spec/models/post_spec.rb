require 'rails_helper'

RSpec.describe 'postモデル機能', type: :model do
  context 'postのcontentが空の場合' do
    it "バリデーションに引っかかる" do
      post = Post.new(content: '')
      expect(post).not_to be_valid
    end
  end
  context 'postのcontentが記載されている場合' do
    it 'バリデーションが通る' do
      post = Post.new(content: 'hogehoge')
      expect(post).to be_valid
    end
  end
end