require 'rails_helper'

describe Book, type: :model do
  it do
    should validate_presence_of(:genre)
  end
  it do
    should validate_presence_of(:author)
  end
  it do
    should validate_presence_of(:image)
  end
  it do
    should validate_presence_of(:title)
  end
  it do
    should validate_presence_of(:publisher)
  end
  it do
    should validate_presence_of(:year)
  end
  subject(:book) do
    Book.new(genre: genre, author: author, image: image,
             title: title, publisher: publisher, year: year)
  end
  let(:genre)            { Faker::Book.genre }
  let(:author)           { Faker::Book.author }
  let(:image)            { Faker::File.file_name('path/to') }
  let(:title)            { Faker::Book.title }
  let(:publisher)        { Faker::Book.publisher }
  let(:year)             { Faker::Date.backward }
  it do
    is_expected.to be_valid
  end
end
