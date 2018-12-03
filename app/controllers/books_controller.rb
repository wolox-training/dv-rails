class BooksController < ApiController
  include Wor::Paginate

  def show
    render json: Book.find(params[:id]), serializer: BookSerializer
  rescue ActiveRecord::RecordNotFound
    render json: { error: "El libro con el id #{params[:id]} no existe" }, status: :not_found
  end

  def index
    render_paginated Book.all
  end

  def info_book
    isbn = params[:isbn]
    return render json: { error: t('.no_isbn') }, status: :bad_request if isbn.nil?

    book_info = OpenLibraryService.new(isbn).book_info
    return render json: { error: t('.no_book_error', code: isbn) }, status: :not_found if
    book_info.empty?

    render json: book_info
  end
end
