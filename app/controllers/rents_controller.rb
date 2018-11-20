class RentsController < ApplicationController
  include Wor::Paginate

  def create
    @rent = Rent.new(params[:rent])
    if @rent.save
      render json: @rent, status: :created
    else
      render json: { error: @rent.errors.messages }, status: :unprocessable_entity
    end
  end

  def index
    @rents = Rent.where(user_id: params[:user_id])
    render_paginated @rents, serializer: RentSerializer
  end
end
