FactoryBot.define do
  factory :book_suggestion do
    synopsis { Faker::Lorem.sentence }
    price { Faker::Number.number(10) }
    author { Faker::Book.author  }
    title { Faker::Book.title }
    link { Faker::Internet.url }
    publisher { Faker::Book.publisher }
    year { Faker::Number.between(1900, 2018) }
  end
end
 