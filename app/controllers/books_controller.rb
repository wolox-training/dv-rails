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
end
