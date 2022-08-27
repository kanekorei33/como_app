FactoryBot.define do
  factory :user do
    name { 'テスト' }
    nickname { 'テストさん'}
    email {'test@gmail.com'}
    password {'123456'}
    password_confirmation {'123456'}
    admin {'false'}
  end
  factory :user_second,class: User do
    name { "ウーパールーパー" }
    nickname { "ウパさん" }
    email { "upaupa@gmail.com" }
    password { "123456" }
    admin { "false" }
  end
  factory :admin_user,class: User do
    name { "テスト管理者" }
    nickname { "管理さん" }
    email { "admin_1@gmail.com" }
    password { "123456" }
    admin { "true" }
  end
end