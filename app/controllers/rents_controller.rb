class RentsController < ApiController
  include Wor::Paginate
  def create
    rent = Rent.new(rent_params.merge(user_id: params[:user_id]))
    authorize rent

    if rent.save
      RentWorker.perform_async(rent.id)
      render json: rent, status: :created
    else
      render json: { error: rent.errors.messages }, status: :unprocessable_entity
    end
  end

  def index
    authorize params[:user_id], policy_class: RentPolicy
    rents = Rent.where(user_id: params[:user_id])
    render_paginated rents
  end

  private

  def rent_params
    params.require(:rent).permit(:book_id, :start_date, :end_date)
  end
end
