class ApiController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActionController::ParameterMissing, with: :missing_parameter

  def user_not_authorized
    render json: { error: 'user not authorized' }, status: :forbidden
  end
end
