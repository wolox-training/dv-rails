class BooksController < ApplicationController
  include Wor::Paginate

  def show
    @book = Book.find(params[:id])
    render json: @book, serializer: BookSerializer
  rescue ActiveRecord::RecordNotFound
    render json: { error: "El libro con el id #{params[:id]} no existe" }, status: :not_found
  end

  def index
    @books = Book.all
    render_paginated @books
  end
end