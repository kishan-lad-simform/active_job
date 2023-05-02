class EventMailer < ApplicationMailer
  default to: -> { User.pluck(:email) },
          from: "ladkishan12345@gmail.com"

  def event_mail
    @events = Event.all
    mail(
      subject: "Total Events",
    )
  end
end
