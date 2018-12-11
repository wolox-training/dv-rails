class BooksController < ApiController
  include Wor::Paginate

  def show
    render json: Book.find(params[:id]), serializer: BookSerializer
  rescue ActiveRecord::RecordNotFound
    render json: { error: t('book_error', code: params[:id]) }, status: :not_found
  end

  def index
    render_paginated Book.all
  end

  def info_book
    book_info = OpenLibraryService.new(info_book_params).book_info
    if book_info.empty?
      render json: { error: t('isbn_error', code: params[:isbn]) }, status: :not_found
    else
      render json: book_info
    end
  end

  private

  def info_book_params
    params.require(:isbn)
  end
end
