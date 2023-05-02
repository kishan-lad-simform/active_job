class CreateEventJob
  include Sidekiq::Job

  def perform(*args)
    @event = Event.create(
      event_name: Faker::Hipster.sentence(word_count: 2),
      description: Faker::Hipster.sentence(word_count: 2),
      event_date: DateTime.now+5.hours+5.minutes+30.seconds
    )
  end
end
