require 'sidekiq'
require 'sidekiq-cron'

Sidekiq::Cron::Job.create(
  name: 'Create event',
  cron: '0 * * * *', 
  class: 'CreateEventJob'
)

Sidekiq::Cron::Job.create(
  name: 'Send event',
  cron: ' 0 1 * * *', 
  class: 'SendEventJob' 
)

Sidekiq::Cron::Job.create(
  name: 'Send notify',
  cron: ' * * * * *', 
  class: 'NotifyEventJob' 
)