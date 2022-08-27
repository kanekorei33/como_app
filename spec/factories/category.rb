FactoryBot.define do

  factory :category do
    name { '周辺情報' }
  end

  factory :second_category, class: Category do
    name { 'イベント情報' }
  end
end