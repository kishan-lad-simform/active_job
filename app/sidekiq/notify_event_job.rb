class NotifyEventJob
  include Sidekiq::Job

  def perform(*args)
    get_dates = DateTime.now+5.hours
    get_event = Event.find_by_event_date(get_dates)
    if get_event.nil?    
    else
      get_users = get_event.users.pluck(:email) 
      NotifyMailer.with(users: get_users, event: get_event).notify_mail.deliver_later
    end
    
  end
end
