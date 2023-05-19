class SendEventJob
  include Sidekiq::Job

  def perform(*args)
    EventMailer.event_mail.deliver_later
  end
end
