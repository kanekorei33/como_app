FactoryBot.define do
  factory :comment do
    content { 'コメントのテストだよ' }
    user { FactoryBot.create(:user) }
  end

  factory :comment_posts, class: Comment do
    content { 'コメントテストだよだよ' }
    user { FactoryBot.create(:user) }
  end
end