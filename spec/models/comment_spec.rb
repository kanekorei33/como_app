require 'rails_helper'

RSpec.describe 'Commentモデル機能', type: :model do
  context 'commentのcontentが空の場合' do
    it "バリデーションに引っかかる" do
      park = FactoryBot.create(:park)
      category = FactoryBot.create(:category)
      comment= FactoryBot.build(:comment, content: nil,
      park: park, category: category)

      expect(comment.valid?).to eq false
    end
  end

  context 'commentのcontentが記載されている場合' do
    it 'バリデーションが通る' do
      user = FactoryBot.create(:user)
      park = FactoryBot.create(:park)
      category = FactoryBot.create(:category)
      comment= FactoryBot.build(:comment, content: 'hogehoge',
      park: park, category: category, user: user)

      expect(comment.valid?).to eq true
    end
  end
end
