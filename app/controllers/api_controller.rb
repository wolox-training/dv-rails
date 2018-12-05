class ApiController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :set_locale, :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    render json: { error: 'user not authorized' }, status: :forbidden
  end

  private

  def set_locale
    I18n.locale = current_user&.locale || I18n.default_locale
  end
end
