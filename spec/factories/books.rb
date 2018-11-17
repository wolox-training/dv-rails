# spec/factories/articles.rb
FactoryBot.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::File.file_name('path/to') }
    title { Faker::Book.title }
    publisher { Faker::Book.publisher }
    year { Faker::Date.backward }
  end
end
