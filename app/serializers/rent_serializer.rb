class RentsController < ApplicationController
  attributes :id, :start_date, :end_date, :image
  has_many :rent
  has_many :user
end
