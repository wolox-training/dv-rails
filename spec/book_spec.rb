require 'rails_helper'

describe Book, type: :model do
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
  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:genre) }
  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:publisher) }
  it { should validate_presence_of(:year) }
end
