class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :trackable
  include DeviseTokenAuth::Concerns::User
  has_many :rents, dependent: :destroy
end
