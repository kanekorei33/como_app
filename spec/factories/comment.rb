FactoryBot.define do
  factory :comment do
    content { 'コメントのテストだよ' }
    user { FactoryBot.create(:user) }
  end

  factory :second_comment, class: Comment do
    content { 'コメントテストだよだよ' }
    user { FactoryBot.create(:user) }
  end
  
  factory :third_comment, class: Comment do
    content { 'コメントテストだよだよ' }
    user { FactoryBot.create(:user) }
  end
end