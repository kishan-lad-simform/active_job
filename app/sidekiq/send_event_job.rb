class SendEventJob
  include Sidekiq::Job

  def perform(*args)
    @users = User.all.to_a
    EventMailer.event_mail.deliver_later
  end
end
