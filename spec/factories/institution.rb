FactoryBot.define do
  factory :institution do
    id {1}
    name {'トイレ'}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/トイレ.jpg'))}
  end
  factory :second_institution, class: Institution do
    id {2}
    name {'水飲み台'}
    image {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/トイレ.jpg'))}
  end
end