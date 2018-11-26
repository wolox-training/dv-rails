class RentsController < ApplicationController
  include Wor::Paginate
  def create
    rent = Rent.new(rent_params)
    if rent.save
      RentNotificationWorker.perform_async(rent.id)
      render json: rent, status: :created
    else
      render json: { error: rent.errors.messages }, status: :unprocessable_entity
    end
  end

  def index
    rents = Rent.where(user_id: params[:user_id])
    render_paginated rents
  end

  private

  def rent_params
    params.require(:rent).permit(:user_id, :book_id, :start_date, :end_date)
  end
end
