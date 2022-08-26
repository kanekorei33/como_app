require 'rails_helper'

RSpec.describe 'commentモデル機能', type: :model do
  context 'commentのcontentが空の場合' do
    it "バリデーションに引っかかる" do
      comment = Comment.new(content: '')
      expect(comment).not_to be_valid
    end
  end
  context 'commentのcontentが記載されている場合' do
    it 'バリデーションが通る' do
      comment = Comment.new(content: 'hogehoge')
      expect(comment).to be_valid
    end
  end
end