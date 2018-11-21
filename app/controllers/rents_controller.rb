class RentsController < ApplicationController
  include Wor::Paginate
  def create
    # byebug
    @rent = Rent.new(rent_params)
    if @rent.save
      render json: @rent
    else
      render json: { error: @rent.errors.messages }, status: :unprocessable_entity
    end
  end

  def index
    @rents = Rent.where(user_id: params[:user_id])
    render_paginated @rents
  end

  private

  def rent_params
    params.require(:rent).permit(:user_id, :book_id, :start_date, :end_date)
  end
end
