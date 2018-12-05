class NotifyRentWorker
  include Sidekiq::Worker

  def perform
    rents = Rent.where to_date: Time.zone.today
    rents.find_each do |rent|
      I18n.locale = rent.user.locale
      RentMailer.with(rent: rent).notify_rent.deliver_now
    end
  end
end
