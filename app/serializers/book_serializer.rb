class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :image
  has_many :rents
end
