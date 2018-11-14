class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    render json: @book, serializer: BookSerializer
  end

  def index
    render json: Book.all, status: :ok
  end
end