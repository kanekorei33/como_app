FactoryBot.define do
  factory :park do
    id {1}
    name {'テスト公園'}
    address {'札幌市中央区テストアドレス'}
    introduction {'きれいな公園です'}
    main_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/中島公園.png'))}
  end
  factory :second_park, class: Park do
    id {2}
    name {'二つ目の公園'}
    address {'札幌市南区テストアドレス'}
    introduction {'広くてきれいな公園です'}
    main_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/中島公園.png'))}
  end
  factory :third_park, class: Park do
    id {3}
    name {'みっつ目の公園'}
    address {'札幌市白石区テストアドレス'}
    introduction {'かわいいリンゴの遊具があります'}
    main_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/中島公園.png'))}
  end
end
