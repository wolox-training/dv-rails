class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :genre, :publisher, :year, :image
  has_many :rents
end
