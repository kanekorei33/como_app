require 'rails_helper'

RSpec.describe 'commentモデル機能', type: :model do
  context 'commentのcontentが空の場合' do
    it "バリデーションに引っかかる" do
      park = FactoryBot.create(:park)
      category = FactoryBot.create(:category)
      comment= FactoryBot.build(:comment, content: nil,
      park: park, category: category)

      expect(comment).not_to be_valid
    end
  end

  context 'commentのcontentが記載されている場合' do
    it 'バリデーションが通る' do
      park = FactoryBot.create(:park)
      category = FactoryBot.create(:category)
      comment= FactoryBot.build(:comment, content: 'hogehoge',
      park: park, category: category)
      expect(comment).to be_valid
    end
  end
end