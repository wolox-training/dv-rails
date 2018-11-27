class RentMailer < ApplicationMailer
  def rent_notification
    @rent = params[:rent]
    @current_date = Time.zone.now.strftime('%d/%m/%Y')
    mail to: @rent.user.email
  end
end
