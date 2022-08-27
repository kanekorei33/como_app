FactoryBot.define do
  factory :comment do
    content { 'コメントのテストだよ' }

  end

  factory :second_comment, class: Comment do
    content { 'コメントテストだよだよ' }

  end

  factory :third_comment, class: Comment do
    content { 'コメントテストだよだよ' }

  end
end