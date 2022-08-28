FactoryBot.define do
  factory :playground do
    id {1}
    name {'ブランコ'}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/ブランコ.jpg'))}
  end
  factory :second_playground, class: Playground do
    id {2}
    name {'シーソー'}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/ブランコ.jpg'))}
  end
end