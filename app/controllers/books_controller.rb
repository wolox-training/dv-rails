class BooksController < ApplicationController
  include Wor::Paginate
  def show
    @book = Book.find(params[:id])
    render json: @book, serializer: BookSerializer
  end

  def index
    @book = Book.all
    render_paginated @book
  end
end
