class RentWorker
  include Sidekiq::Worker

  def perform(rent_id)
    rent = Rent.find(rent_id)
    I18n.locale = rent.user.locale
    RentMailer.with(rent: rent).rent_notification.deliver_now
  end
end
