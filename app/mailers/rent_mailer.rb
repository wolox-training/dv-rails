class RentMailer < ApplicationMailer
  def rent_notification
    @rent = params[:rent]
    @current_date = Time.zone.now.strftime('%d/%m/%Y')
    mail to: @rent.user.email
  end

  def notify_rent
    @rent = params[:rent]
    mail to: @rent.user.email
  end
end
